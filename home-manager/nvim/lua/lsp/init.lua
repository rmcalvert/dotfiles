local u = require("lsp.utils")

local lsp = vim.lsp

local border_opts = { border = "single", focusable = false, scope = "line" }

vim.diagnostic.config({ virtual_text = false, float = border_opts })

lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, border_opts)
lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, border_opts)

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-tool-installer").setup({
    ensure_installed = {
        "lua-language-server",
        "stylua",
        "typescript-language-server",
        "vtsls", 
        "eslint_d",
        "prettierd",
        -- "solargraph", solargraph require ruby >2.7. Disabled until available
        -- "rust-analyzer",
        "codelldb",
    },
    auto_update = false,
    run_on_start = false,
})

-- local lsp_formatting = function(bufnr)
--     vim.lsp.buf.format({
--         filter = function(client)
--             return client.name ~= "tsserver"
--         end,
--         timeout_ms = 5000,
--         bufnr = bufnr,
--     })
-- end

-- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
-- local event = "BufWritePre" -- or "BufWritePost"
-- local async = event == "BufWritePost"

local on_attach = function(client, bufnr)
    -- commands
    u.buf_command(bufnr, "LspHover", vim.lsp.buf.hover)
    u.buf_command(bufnr, "LspRename", vim.lsp.buf.rename)
    -- u.buf_command(bufnr, "LspFormatting", function()
    --     vim.lsp.buf.format({
    --         timeout_ms = 8000,
    --     })
    -- end)
    u.buf_command(bufnr, "LspDiagPrev", vim.diagnostic.goto_prev)
    u.buf_command(bufnr, "LspDiagNext", vim.diagnostic.goto_next)
    u.buf_command(bufnr, "LspDiagLine", function()
        vim.diagnostic.open_float(nil, border_opts)
    end)
    u.buf_command(bufnr, "LspDiagQuickfix", vim.diagnostic.setqflist)
    u.buf_command(bufnr, "LspSignatureHelp", vim.lsp.buf.signature_help)
    u.buf_command(bufnr, "LspTypeDef", vim.lsp.buf.type_definition)
    u.buf_command(bufnr, "LspAct", vim.lsp.buf.code_action)
    u.buf_command(bufnr, "LspRef", vim.lsp.buf.references)
    u.buf_command(bufnr, "LspDef", vim.lsp.buf.definition)
    u.buf_command(bufnr, "LspImplementation", vim.lsp.buf.implementation)

    -- bindings
    u.buf_map(bufnr, "n", "gi", ":LspRename<CR>")
    u.buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    u.buf_map(bufnr, "n", "gh", ":LspHover<CR>")
    u.buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    u.buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    u.buf_map(bufnr, "n", "ge", ":LspDiagLine<CR>")
    u.buf_map(bufnr, "n", "<Leader>q", ":LspDiagQuickfix<CR>")
    -- u.buf_map(bufnr, "n", "<Leader>f", ":LspFormatting<CR>")
    u.buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    u.buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")

    u.buf_map(bufnr, "n", "ga", ":LspAct<CR>")
    u.buf_map(bufnr, "n", "gr", ":LspRef<CR>")

    if client.supports_method("textDocument/formatting") then
        vim.keymap.set("n", "<Leader>f", function()
            vim.lsp.buf.format({
                filter = function(client)
                    return client.name ~= "vtsls" -- changes to ts_ls?
                end,
                bufnr = vim.api.nvim_get_current_buf(),
                timeout_ms = 8000,
            })
        end, { buffer = bufnr, desc = "[lsp] format" })

        -- -- format on save
        -- vim.api.nvim_clear_autocmds({ buffer = bufnr, group = group })
        -- vim.api.nvim_create_autocmd(event, {
        --   buffer = bufnr,
        --   group = group,
        --   callback = function()
        --     vim.lsp.buf.format({ bufnr = bufnr, async = async })
        --   end,
        --   desc = "[lsp] format on save",
        -- })
    end

    if client.supports_method("textDocument/rangeFormatting") then
        vim.keymap.set("x", "<Leader>f", function()
            vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf(), timeout_ms = 8000 })
        end, { buffer = bufnr, desc = "[lsp] format" })
    end

    require("illuminate").on_attach(client)
    require("lspfuzzy").setup({})
end

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs({
    "lua_ls",
    "solargraph",
    "standardrb",
    -- "ts_ls",
    "vtsls",
    "rust",
    "null-ls",
}) do
    require("lsp." .. server).setup(on_attach, capabilities)
end

-- suppress irrelevant messages
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("%[lspconfig%]") then
        return
    end

    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
