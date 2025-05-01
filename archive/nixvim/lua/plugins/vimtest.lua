local utils = require("lsp.utils")

vim.g["test#strategy"] = "kitty"

vim.api.nvim_set_keymap("n", "<leader>tn", ":TestNearest<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tf", ":TestFile<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>ts", ":TestSuite<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tl", ":TestLast<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>tg", ":TestVisit<CR>", {})
