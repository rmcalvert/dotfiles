local u = require("lsp.utils")
local api = vim.api

local M = {}
M.setup = function(on_attach, capabilities)
    -- require("typescript").setup({
    --     server = {
    --         on_attach = function(client, bufnr)
    --             u.buf_map(bufnr, "n", "gs", ":TypescriptRemoveUnused<CR>")
    --             u.buf_map(bufnr, "n", "gS", ":TypescriptOrganizeImports<CR>")
    --             u.buf_map(bufnr, "n", "go", ":TypescriptAddMissingImports<CR>")
    --             u.buf_map(bufnr, "n", "gA", ":TypescriptFixAll<CR>")
    --             u.buf_map(bufnr, "n", "gI", ":TypescriptRenameFile<CR>")

    --             on_attach(client, bufnr)
    --         end,
    --         capabilities = capabilities,
    --     },
    -- })
end

return M
