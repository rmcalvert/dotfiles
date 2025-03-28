local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

_G.global = {}

vim.g.mapleader = " "
-- require("options")
-- require("lazy").setup({ { import = "pluginList" } })
-- require("mappings")
-- require("utils")

-- Ensure trailing newline for appending nix config

