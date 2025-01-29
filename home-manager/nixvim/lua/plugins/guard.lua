local ft = require("guard.filetype")


 -- ft("lua"):fmt("stylua")

  -- - local prettierd = {
-- -     cmd = "prettierd",
-- -     fname = true,
-- -     stdin = true,
-- - }
--
--ft("typescript,javascript,typescriptreact"):fmt(prettierd)

--    cmd("prettier"),
--})
-- M.prettier = {
--   cmd = 'prettier',
--   args = { '--stdin-filepath' },
--   fname = true,
--   stdin = true,
-- }
--
--
require("guard").setup({
    fmt_on_save = true,
    lsp_as_default_formatter = true,
})
