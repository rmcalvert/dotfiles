-- local settings = {
--     Lua = {
--         diagnostics = {
--             globals = {
--                 "global",
--                 "vim",
--                 "use",
--                 "describe",
--                 "it",
--                 "assert",
--                 "before_each",
--                 "after_each",
--                     },
--         },
--         completion = {
--             showWord = "Disable",
--             callSnippet = "Disable",
--             keywordSnippet = "Disable",
--         },
--     },
-- }

local M = {}

M.setup = function(on_attach, capabilities)
    require("neodev").setup({})
    -- --local neodev = require("neodev").setup({
    --     lspconfig = {
    --         on_attach = on_attach,
    --         settings = settings,
    --         flags = {
    --             debounce_text_changes = 150,
    --         },
    --         capabilities = capabilities,
    --     },
    -- })
    require("lspconfig").lua_ls.setup({
        lspconfig = {
            on_attach = on_attach,
            capabilities = capabilities,
        },
    })
end

return M
