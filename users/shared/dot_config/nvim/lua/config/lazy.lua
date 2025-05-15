-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.g.maplocalleader = " "
vim.opt.shadafile = "NONE" -- don't write to the ShaDa file on startup
vim.opt.shiftwidth = 2 -- Tab width 2
vim.opt.softtabstop = -1
vim.opt.tabstop = 2
vim.opt.ruler = true
vim.opt.hidden = true
vim.opt.smarttab = true
vim.opt.termguicolors = true
vim.opt.shiftround = true
vim.opt.ignorecase = true
vim.opt.magic = true
vim.opt.smartcase = true
vim.opt.infercase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.complete = ".,w,b,k"
vim.opt.inccommand = "nosplit"
vim.opt.formatoptions = "1jcroql"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --hidden --vimgrep --smart-case --"
----       # breakat = [[\ \	;:,!?]];
vim.opt.startofline = false
vim.opt.backspace = "indent,eol,start"
vim.opt.diffopt = "filler,iwhite,internal,algorithm:patience"
vim.opt.completeopt = "menu,menuone,noselect" -- specified by nvim-cmp;
vim.opt.jumpoptions = "stack"
vim.opt.whichwrap = "h,l,<,>,[,],~"
vim.opt.switchbuf = "useopen"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cul = true
----       # mouse = "a" -- "nv";
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80,120"
vim.opt.errorbells = true
vim.opt.visualbell = true
vim.opt.fileformats = "unix,mac,dos"
vim.opt.cmdheight = 1
vim.opt.virtualedit = "block"
vim.opt.encoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.wildignorecase = true
vim.opt.wildignore =
	".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
vim.opt.viewoptions = "folds,cursor,curdir,slash,unix"
vim.opt.sessionoptions = "curdir,help,tabpages,winsize"
vim.opt.updatetime = 250 -- update interval for gitsigns;
vim.opt.redrawtime = 1500
vim.opt.timeoutlen = 400
vim.opt.timeout = true
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 2
vim.opt.sidescrolloff = 5
vim.opt.foldlevelstart = 99
----       # lazyredraw = true;
vim.opt.linebreak = true
vim.opt.wrap = false
----       # textwidth = 120;
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:list:full"
vim.opt.list = true
vim.opt.showtabline = 0
----       #Jdirectory = global.cache_path .. "swag/";
----       # undodir = global.cache_path .. "undo/";
----       # backupdir = global.cache_path .. "backup/";
----       # viewdir = global.cache_path .. "view/";
----       # spellfile = global.cache_path .. "spell/en.uft-8.add";
vim.opt.history = 2000
vim.opt.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2 -- Make the line number column thinner
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.winwidth = 30
vim.opt.winminwidth = 10
vim.opt.pumheight = 15
vim.opt.helpheight = 12
vim.opt.previewheight = 12
vim.opt.showcmd = false
vim.opt.cmdwinheight = 5
vim.opt.equalalways = false
vim.opt.laststatus = 3 -- display single status line instead of one for each buffer
vim.opt.display = "lastline"
vim.opt.foldmethod = "indent"
vim.opt.cursorline = true
vim.opt.cursorcolumn = false
vim.opt.autoindent = true
vim.opt.showbreak = " ↳  "
vim.opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
vim.opt.pumblend = 20
vim.opt.winblend = 20
----       #  shortmess options
----       #  shortmess:append("asI") # disable intro
vim.opt.showmode = false
vim.opt.shortmess = "aoOTIcF"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

require("config.lsp")

vim.opt.shada = "!,'300,<50,@100,s10,h"
