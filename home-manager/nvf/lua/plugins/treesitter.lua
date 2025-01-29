-- require("nvim-treesitter.install").prefer_git = true

local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return
end

ts_config.setup({
    ensure_installed = "all",
    matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        -- disable = { "c", "ruby" }, -- optional, list of language that will be disabled
        disable = {}, -- optional, list of language that will be disabled
        -- [options]
    },
    highlight = {
        enable = true,
        --   use_languagetree = true
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
        },
    },
    --indent = {
    --    enable = true,
    --    disable = { "yaml" },
    --},
    --plugins
    -- context_commentstring = {
    --   enable = true,
    -- },
    -- textsubjects = {
    --   enable = true,
    --   keymaps = {
    --     ["."] = "textsubjects-smart",
    --     [";"] = "textsubjects-container-outer",
    --   },
    -- },
})
