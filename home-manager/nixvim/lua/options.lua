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

-- vim.o.guifont = "FiraCode Nerd Font:h15"
