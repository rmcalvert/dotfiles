-- local M = {}
-- M.setup = function(on_attach, capabilities)
--     local rt = require("rustaceanvim")
--     rt.setup({
--         server = {
--             --         on_attach = function(client, bufnr)
--             --             -- Hover actions
--             --             vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--             --             -- Code action groups
--             --             vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--             --             on_attach(client, bufnr)
--             --         end,
--             capabilities = capabilities,
--         },
--     })
-- end
-- return M

local M = {}
M.setup = function(on_attach, capabilities)
    vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {},
        -- LSP configuration
        server = {
            on_attach = function(client, bufnr)
                -- you can also put keymaps in here
                on_attach(client, bufnr)
            end,
            default_settings = {
                -- rust-analyzer language server configuration
                ["rust-analyzer"] = {},
            },
            capabilities = capabilities,
        },
        -- DAP configuration
        dap = {},
    }
end
return M
