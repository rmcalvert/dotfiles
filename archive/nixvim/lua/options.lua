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
    synmaxcol = 2500,
    textwidth = 120,
    breakindentopt = "shift:2,min:20",
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
