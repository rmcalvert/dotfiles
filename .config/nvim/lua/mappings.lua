local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local cmd = vim.cmd
local opt = {}


-- toggle numbers
map("n", "<leader>n", [[ <Cmd> set nu!<CR>]], opt)

-- Truezen.nvim
map("n", "<leader>tz", [[<Cmd>TZAtaraxis<CR>]], opt) --ataraxis

-- Commenter Keybinding
map("n", "<leader>/", ":CommentToggle<CR>", opt)
map("v", "<leader>/", ":CommentToggle<CR>", opt)

-- map("n", "<leader>f", ":LspFormatting<CR>", opt)

-- NvimTree
--map("n", "<leader>op", ":NvimTree<CR>", opt)
map("n", "<S-x>", ":NvimTreeToggle<CR>", opt) -- Nvim tree explorer

map("i", "jk", "<esc>") --jk to exit
map("c", "jk", "<C-C>")
map("n", ";", ":") --semicolon to enter command mode
map("n", "j", "gj") --move by visual line not actual line
map("n", "k", "gk")
-- map("n", "<leader>ww", [[<Cmd>HopWord<CR>]], opt) --easymotion/hop
-- map("n", "<leader>l", [[<Cmd>HopLine<CR>]], opt)
map("n", "<leader>fP", [[<Cmd>e ~/.config/nvim/init.lua<CR>]], opt)

map("n", "<leader>bd", [[:Bdelete<CR>]], opt)

map("n", "<c-k>", [[<Cmd>wincmd k<CR>]], opt) --ctrlhjkl to navigate splits
map("n", "<c-j>", [[<Cmd>wincmd j<CR>]], opt)
map("n", "<c-h>", [[<Cmd>wincmd h<CR>]], opt)
map("n", "<c-l>", [[<Cmd>wincmd l<CR>]], opt)

map("n", "[q", [[<Cmd>cprev<CR>]], opt)
map("n", "]q", [[<Cmd>cnext<CR>]], opt)

-- cmd([[autocmd BufWritePre * %s/\s\+$//e]]) --remove trailing whitespaces
-- cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

-- Telescope
-- map("n", "<Leader>gt", [[<Cmd> Telescope git_status <CR>]], opt)
-- map("n", "<Leader>cm", [[<Cmd> Telescope git_commits <CR>]], opt)
map("n", "<Leader>ff", [[<Cmd>Telescope find_files<CR>]], opt)
map("n", "<Leader><Leader>", [[<Cmd>Telescope live_grep<CR>]], opt)
-- map("n", "<Leader>bb", [[<Cmd>Telescope buffers<CR>]], opt)
-- map("n", "<Leader>fh", [[<Cmd>Telescope help_tags<CR>]], opt)
-- map("n", "<Leader>fr", [[<Cmd>Telescope oldfiles<CR>]], opt)
map("n", "<S-k>", [[<Cmd>Telescope grep_string<CR>]], opt)

-- move between tabs
map("n", "<TAB>", [[<Cmd>BufferLineCycleNext<CR>]], opt)
map("n", "<S-TAB>", [[<Cmd>BufferLineCyclePrev<CR>]], opt)

--sniprun
map("n", "<Leader>gR", [[<Cmd>SnipRun<CR>]], opt)

-- Packer commands till because we are not loading it at startup
-- vim.cmd("silent! command PackerCompile lua require 'pluginList' require('packer').compile()")
-- vim.cmd("silent! command PackerInstall lua require 'pluginList' require('packer').install()")
-- vim.cmd("silent! command PackerStatus lua require 'pluginList' require('packer').status()")
-- vim.cmd("silent! command PackerSync lua require 'pluginList' require('packer').sync()")
-- vim.cmd("silent! command PackerUpdate lua require 'pluginList' require('packer').update()")

vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").open("quickfix") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").open("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
