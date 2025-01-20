-- local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
    b.diagnostics.eslint_d,
    b.code_actions.eslint_d,
    b.formatting.prettierd.with({
        filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "json",
            "typescript",
            "typescriptreact",
        },
        disabled_filetypes = {}, --"typescript", "typescriptreact", "javascript", "javascriptreact"}
    }),
}

local M = {}
M.setup = function(on_attach, capabilities)
    null_ls.setup({
        debug = false,
        debounce = 250,
        diagnostics_format = "#{m} [#{c} (#{s})]",
        sources = sources,
        on_attach = on_attach,
        capabilities = capabilities,
    })
end

return M
