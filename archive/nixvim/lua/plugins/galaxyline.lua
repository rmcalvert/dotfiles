local present1, gl = pcall(require, "galaxyline")
local present2, condition = pcall(require, "galaxyline.condition")
if not (present1 or present2) then
    return
end

local vcs = require("galaxyline.providers.vcs")

gl.exclude_filetypes = { "ctrlspace" }

local gls = gl.section

gl.short_line_list = { " " }

--local colors = {
--  bg = "NONE",
--  white = "#ECEFF4",
--  fg = "#E5E9F0",
--  yellow = "#EBCB8B",
--  cyan = "#A3BE8C",
--  darkblue = "#81A1C1",
--  green = "#8FBCBB",
--  orange = "#D08770",
--  purple = "#B48EAD",
--  magenta = "#BF616A",
--  gray = "#616E88",
--  blue = "#5E81AC",
--  red = "#BF616A"
--}

local colors = {
    bg = "#252A34",
    fg = "#D9DA9E",
    color_0 = "#00839F",
    color_1 = "#1C9898",
    color_2 = "#25B8A5",
    color_3 = "#56adb7",
    color_4 = "#F2994B",
    color_5 = "#E6B673",
    color_6 = "#F05F4E",
    color_7 = "#98c379",
}

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
        return true
    end
    return false
end

gl.short_line_list = {
    "NvimTree",
    "LvimHelper",
    "dashboard",
    "vista",
    "dbui",
    "packer",
}
-- gls.left[1] = {
--     ViMode = {
--         provider = function()
--             -- auto change color according the vim mode
--             local alias = {
--                 n = "NORMAL",
--                 v = "VISUAL",
--                 V = "V-LINE",
--                 [""] = "V-BLOCK",
--                 s = "SELECT",
--                 S = "S-LINE",
--                 [""] = "S-BLOCK",
--                 i = "INSERT",
--                 R = "REPLACE",
--                 c = "COMMAND",
--                 r = "PROMPT",
--                 ["!"] = "EXTERNAL",
--                 t = "TERMINAL",
--             }
--             local mode_color = {
--                 n = colors.color_1,
--                 v = colors.color_5,
--                 V = colors.color_5,
--                 [""] = colors.color_5,
--                 s = colors.color_5,
--                 S = colors.color_5,
--                 [""] = colors.color_5,
--                 i = colors.color_6,
--                 R = colors.color_6,
--                 c = colors.color_0,
--                 r = colors.color_0,
--                 ["!"] = colors.color_0,
--                 t = colors.color_0,
--             }
--             local vim_mode = vim.fn.mode()
--             vim.api.nvim_command("hi GalaxyViMode guifg=" .. mode_color[vim_mode])
--             return alias[vim_mode] .. "    "
--         end,
--         highlight = { colors.color_3, colors.bg, "bold" },
--     },
-- }
-- gls.left[2] = {
--     FileIcon = {
--         provider = "FileIcon",
--         condition = buffer_not_empty,
--         highlight = { colors.fg, colors.bg },
--     },
-- }

gls.left[1] = {
    FileName = {
        provider = { "FileName" },
        condition = buffer_not_empty,
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.fg, colors.bg },
    },
}

gls.left[2] = {
    GitIcon = {
        condition = condition.check_git_workspace,
        provider = function()
            return "  "
        end,
        -- separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.color_5, colors.bg },
    },
}
gls.left[3] = {
    GitBranch = {
        provider = "GitBranch",
        condition = condition.check_git_workspace,
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.color_5, colors.bg },
    },
}
gls.left[4] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = condition.hide_in_width,
        icon = "   ",
        highlight = { colors.color_7, colors.bg },
    },
}
gls.left[5] = {
    DiffModified = {
        provider = "DiffModified",
        condition = condition.hide_in_width,
        icon = "   ",
        highlight = { colors.color_4, colors.bg },
    },
}
gls.left[6] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = condition.hide_in_width,
        icon = "   ",
        highlight = { colors.color_6, colors.bg },
    },
}
gls.left[7] = {
    GetGitDir = {
        provider = { vcs.get_git_dir },
        condition = condition.check_git_workspace,
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.color_5, colors.bg },
    },
}

gls.right[1] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        icon = "  ",
        highlight = { colors.color_6, colors.bg },
    },
}
gls.right[2] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        icon = "  ",
        highlight = { colors.color_4, colors.bg },
    },
}
gls.right[3] = {
    DiagnosticHint = {
        provider = "DiagnosticHint",
        icon = "  ",
        highlight = { colors.color_3, colors.bg },
    },
}
gls.right[4] = {
    DiagnosticInfo = {
        provider = "DiagnosticInfo",
        icon = "  ",
        highlight = { colors.color_3, colors.bg },
    },
}
gls.right[5] = {
    ShowLspClient = {
        provider = "GetLspClient",
        condition = function()
            local tbl = { ["dashboard"] = true, [" "] = true }
            if tbl[vim.bo.filetype] then
                return false
            end
            return true
        end,
        icon = "   ",
        highlight = { colors.color_1, colors.bg },
    },
}
gls.right[6] = {
    LineInfo = {
        provider = "LineColumn",
        separator = "  ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.fg, colors.bg },
    },
}
gls.right[7] = {
    PerCent = {
        provider = "LinePercent",
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.fg, colors.bg },
    },
}
-- gls.right[8] = {
--     Tabstop = {
--         provider = function()
--             return "Spaces: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
--         end,
--         condition = condition.hide_in_width,
--         separator = " ",
--         separator_highlight = { "NONE", colors.bg },
--         highlight = { colors.fg, colors.bg },
--     },
-- }
gls.right[8] = {
    BufferType = {
        provider = "FileTypeName",
        condition = condition.hide_in_width,
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.fg, colors.bg },
    },
}
-- gls.right[10] = {
--     FileEncode = {
--         provider = "FileEncode",
--         condition = condition.hide_in_width,
--         separator = " ",
--         separator_highlight = { "NONE", colors.bg },
--         highlight = { colors.fg, colors.bg },
--     },
-- }
gls.right[9] = {
    Space = {
        provider = function()
            return " "
        end,
        separator = " ",
        separator_highlight = { "NONE", colors.bg },
        highlight = { colors.fg, colors.bg },
    },
}
gls.short_line_left[1] = {
    SFileName = {
        provider = "SFileName",
        condition = condition.buffer_not_empty,
        highlight = { colors.fg, colors.bg },
    },
}
gls.short_line_right[1] = {
    BufferIcon = {
        provider = "BufferIcon",
        highlight = { colors.fg, colors.bg },
    },
}

--gls.left[1] = {
--    RainbowRed = {
--    provider = function() return '▊ ' end,
--    highlight = {colors.blue,colors.bg}
--  },
--}
--gls.left[2] = {
--    ViMode = {
--        provider = function()
--            -- auto change color according the vim mode
--            local mode_color = {
--                n = colors.cyan, i = colors.blue, v = colors.yellow,
--                [''] = colors.orange, V = colors.yellow,
--                c = colors.magenta, no = colors.green, s = colors.green,
--                S = colors.orange, [''] = colors.orange,
--                ic = colors.yellow, R = colors.magenta, Rv = colors.magenta,
--                cv = colors.red, ce = colors.red, r = colors.cyan,
--                rm = colors.cyan, ['r?'] = colors.cyan,
--                ['!'] = colors.red, t = colors.red
--            }
--            vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
--            return '  '
--        end,
--        highlight = {colors.red,colors.bg,'bold'},
--    },
--}
--gls.left[3] = {
--  Space = {
--    provider = function () return ' ' end
--  }
--}
--gls.left[4] = {
--    FileSize = {
--        provider = 'FileSize',
--        separator = '',
--        condition = condition.buffer_not_empty,
--        highlight = {colors.fg,colors.bg}
--    },
--}
--gls.left[5] = {
--  Space = {
--    provider = function () return ' ' end
--  }
--}
--gls.left[6] ={
--    FileIcon = {
--        provider = 'FileIcon',
--        condition = condition.buffer_not_empty,
--        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
--    },
--}
--gls.left[7] = {
--    FileName = {
--        provider = {'FileName'},
--        separator = '',
--        condition = condition.buffer_not_empty,
--        highlight = {colors.green, colors.bg,'bold'}
--    }
--
--}
--gls.left[8] = {
--  Space = {
--    provider = function () return ' ' end
--  }
--}
--gls.left[9] = {
--    LineInfo = {
--        provider = 'LineColumn',
--        separator = '',
--        separator_highlight = {'NONE',colors.bg},
--        highlight = {colors.fg,colors.bg},
--    },
--}
--gls.left[10] = {
--    PerCent = {
--        provider = 'LinePercent',
--        separator = '',
--        separator_highlight = {'NONE',colors.bg},
--        highlight = {colors.grey,colors.bg,'bold'},
--    }
--}
--gls.left[11] = {
--    DiagnosticError = {
--        provider = 'DiagnosticError',
--        icon = '  ',
--        highlight = {colors.red,colors.bg}
--    }
--}
--gls.left[12] = {
--    DiagnosticWarn = {
--        provider = 'DiagnosticWarn',
--        icon = '  ',
--        highlight = {colors.yellow,colors.bg},
--    }
--}
--gls.left[13] = {
--    DiagnosticHint = {
--        provider = 'DiagnosticHint',
--        icon = '  ',
--        highlight = {colors.cyan,colors.bg},
--    }
--}
--gls.left[14] = {
--    DiagnosticInfo = {
--        provider = 'DiagnosticInfo',
--        icon = '  ',
--        highlight = {colors.blue,colors.bg},
--    }
--}
--gls.right[1] = {
--    FileEncode = {
--        provider = 'FileEncode',
--        condition = condition.hide_in_width,
--        separator = '  ',
--        separator_highlight = {'NONE',colors.bg},
--        highlight = {colors.green,colors.bg,'bold'}
--    }
--}
--
--gls.right[2] = {
--    ShowLspClient = {
--        provider = 'GetLspClient',
--        condition = function ()
--          local tbl = {['dashboard'] = true,['']=true}
--          if tbl[vim.bo.filetype] then
--            return false
--          end
--          return true
--        end,
--        icon = '   ',
--        highlight = {colors.yellow,colors.bg,'bold'}
--    }
--}
--gls.right[3] = {
--    FileFormat = {
--        provider = 'FileFormat',
--        condition = condition.hide_in_width,
--        separator = '  ',
--        separator_highlight = {'NONE',colors.bg},
--        highlight = {colors.green,colors.bg,'bold'}
--    }
--}
--gls.right[4] = {
--    GitIcon = {
--        provider = function() return '  ' end,
--        condition = condition.check_git_workspace,
--        separator = ' ',
--        separator_highlight = {'NONE',colors.bg},
--        highlight = {colors.magenta,colors.bg,'bold'},
--    }
--}
--gls.right[5] = {
--    GitBranch = {
--        provider = 'GitBranch',
--        condition = condition.check_git_workspace,
--        highlight = {colors.magenta,colors.bg,'bold'},
--    }
--}
--gls.right[6] = {
--    DiffAdd = {
--        provider = 'DiffAdd',
--        condition = condition.hide_in_width,
--        icon = '    ',
--        highlight = {colors.green,colors.bg},
--    }
--}
--gls.right[7] = {
--    DiffModified = {
--        provider = 'DiffModified',
--        condition = condition.hide_in_width,
--        icon = ' 柳',
--        highlight = {colors.orange,colors.bg},
--    }
--}
--gls.right[8] = {
--    DiffRemove = {
--        provider = 'DiffRemove',
--        condition = condition.hide_in_width,
--        icon = '  ',
--        highlight = {colors.red,colors.bg},
--    }
--}
--gls.right[9] = {
--  Space = {
--    provider = function () return ' ' end
--  }
--}
--gls.right[10] = {
--    RainbowRed = {
--    provider = function() return ' ▊' end,
--    highlight = {colors.blue,colors.bg}
--  },
--}
--gls.short_line_left[1] = {
--    BufferType = {
--        provider = 'FileTypeName',
--        separator = ' ',
--        separator_highlight = {'NONE',colors.bg},
--        highlight = {colors.blue,colors.bg,'bold'}
--    }
--}
--gls.short_line_left[2] = {
--    SFileName = {
--        provider =  'SFileName',
--        condition = condition.buffer_not_empty,
--        highlight = {colors.fg,colors.bg,'bold'}
--    }
--}
--
--gls.short_line_right[1] = {
--    BufferIcon = {
--        provider= 'BufferIcon',
--        highlight = {colors.fg,colors.bg}
--    }
--}
