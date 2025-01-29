local opt = vim.opt
local g = vim.g
-- local global = require("global")

--don't write to the ShaDa file on startup
opt.shadafile = "NONE"

--set termguicolors
opt.termguicolors = true

--fish slows things down
--opt.shell = "/bin/bash"

opt.ruler = true
opt.hidden = true
opt.smarttab = true
opt.shiftround = true
opt.ignorecase = true
opt.magic = true
opt.smartcase = true
opt.infercase = true
opt.incsearch = true
opt.wrapscan = true
opt.complete = ".,w,b,k"
opt.inccommand = "nosplit"
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --hidden --vimgrep --smart-case --"
opt.breakat = [[\ \	;:,!?]]
opt.startofline = false
opt.backspace = "indent,eol,start"
opt.diffopt = "filler,iwhite,internal,algorithm:patience"
opt.completeopt = "menu,menuone,noselect" -- specified by nvim-cmp
opt.jumpoptions = "stack"
opt.whichwrap = "h,l,<,>,[,],~"
opt.switchbuf = "useopen"
opt.splitbelow = true
opt.splitright = true
opt.cul = true
opt.mouse = "a" -- "nv"
opt.signcolumn = "yes"
opt.errorbells = true
opt.visualbell = true
opt.fileformats = "unix,mac,dos"
opt.cmdheight = 1
opt.virtualedit = "block"
opt.encoding = "utf-8"
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.swapfile = false
opt.wildignorecase = true
opt.wildignore =
".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**"
opt.viewoptions = "folds,cursor,curdir,slash,unix"
opt.sessionoptions = "curdir,help,tabpages,winsize"
opt.updatetime = 250 -- update interval for gitsigns
opt.redrawtime = 1500
opt.timeoutlen = 400
opt.timeout = true
opt.ttimeout = true
opt.ttimeoutlen = 10
opt.clipboard = "unnamedplus"
opt.scrolloff = 2
opt.sidescrolloff = 5
opt.foldlevelstart = 99
opt.lazyredraw = true
opt.linebreak = true
opt.wrap = true
opt.textwidth = 120
opt.wildmenu = true
opt.wildmode = "longest:list:full"
opt.list = true
opt.showtabline = 0

opt.directory = global.cache_path .. "swag/"
opt.undodir = global.cache_path .. "undo/"
opt.backupdir = global.cache_path .. "backup/"
opt.viewdir = global.cache_path .. "view/"
opt.spellfile = global.cache_path .. "spell/en.uft-8.add"
opt.history = 2000
opt.backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim"

-- Numbers
opt.number = true
opt.relativenumber = false
opt.numberwidth = 2

-- for indentline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

opt.winwidth = 30
opt.winminwidth = 10
opt.pumheight = 15
opt.helpheight = 12
opt.previewheight = 12
opt.showcmd = false
opt.cmdwinheight = 5
opt.equalalways = false
opt.laststatus = 3 -- display single status line instead of one for each buffer
opt.display = "lastline"
opt.foldmethod = "indent"
opt.cursorline = true
opt.cursorcolumn = false
opt.showbreak = " ↳  "
opt.listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←"
opt.pumblend = 20
opt.winblend = 20

-- shortmess options
-- opt.shortmess:append("asI") --disable intro
opt.showmode = false
opt.shortmess = "aoOTIcF"

-- disable tilde on end of buffer:
vim.cmd("let &fcs='eob: '")

local options_set = function(options)
    for k, v in pairs(options) do
        if v == true or v == false then
            vim.cmd("set " .. k)
        else
            vim.cmd("set " .. k .. "=" .. v)
        end
    end
end

local set_opt = {
    nocompatible = true,
    cmdheight = 1,
    synmaxcol = 2500,
    formatoptions = "1jcroql",
    textwidth = 120,
    expandtab = true,
    autoindent = true,
    signcolumn = "yes",
    tabstop = 2,
    shiftwidth = 2,
    softtabstop = -1,
    breakindentopt = "shift:2,min:20",
    linebreak = true,
    colorcolumn = "120",
    foldenable = true,
    -- conceallevel = 2,
    concealcursor = "niv",
}
options_set(set_opt)

local disabled_built_ins = {
    -- "netrw",
    -- "matchit",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

--neovide
g.neovide_fullscreen = true
-- vim.o.guifont = "FiraCode Nerd Font:h15"
