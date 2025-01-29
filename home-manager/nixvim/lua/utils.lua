-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec(
    [[
    au TermOpen term://* setlocal nonumber laststatus=0
   au TermClose term://* bd!
   au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=3 | endif
]],
    false
)

--we can load shada now
-- vim.opt.shadafile = ""
vim.opt.shada = "!,'300,<50,@100,s10,h"
