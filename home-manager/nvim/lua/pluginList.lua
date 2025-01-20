return {
     "tpope/vim-surround",
     "nvim-lua/plenary.nvim",
     "nvim-lua/popup.nvim",
     {
         "airblade/vim-rooter",
         config = function()
             require("plugins.rooter")
         end,
     },
     {
    x     "folke/tokyonight.nvim",
         config = function()
             vim.cmd("colorscheme tokyonight")
         end,
     },

     {
         "ray-x/go.nvim",
         dependencies = { -- optional packages
             "ray-x/guihua.lua",
             "neovim/nvim-lspconfig",
             "nvim-treesitter/nvim-treesitter",
         },
         config = function()
             require("go").setup()
         end,
         event = { "CmdlineEnter" },
         ft = { "go", "gomod" },
         build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
     },

     "nvim-tree/nvim-web-devicons",

     {
         "nvimdev/guard.nvim",
         dependencies = {
             "nvimdev/guard-collection",
         },
         config = function()
             require("plugins.guard")
         end,
     },
     "famiu/bufdelete.nvim", -- Delete buffers without changing window layout (Bdelete)
     {
         "akinsho/bufferline.nvim",
         config = function()
             require("plugins.bufferline")
         end,
     },
     {
         "NTBBloodbath/galaxyline.nvim",
         event = { "VimEnter", "BufRead", "BufNewFile" },
         config = function()
             require("plugins.galaxyline")
         end,
     },
     {
         "akinsho/nvim-toggleterm.lua",
         config = function()
             require("plugins.toggleterm")
         end,
     },
     {
         "norcalli/nvim-colorizer.lua",
         event = "BufRead",
         config = function()
             require("plugins.others").colorizer()
         end,
     },
     "nvim-treesitter/playground",

     {
         "nvim-treesitter/nvim-treesitter",
         build = ":TSUpdate",
         config = function()
             require("plugins.treesitter")
         end,
     },

     "folke/neodev.nvim", -- better sumneko_lua settings

     {
         "nvim-tree/nvim-tree.lua",
         cmd = "NvimTreeToggle",
         dependencies = {
             "nvim-tree/nvim-web-devicons",
         },
         config = function()
             require("plugins.nvimtree")
         end,
     },
     {
         "folke/trouble.nvim",
         dependencies = { "nvim-tree/nvim-web-devicons" },
         opts = {
             -- your configuration comes here
             -- or leave it empty to use the default settings
             -- refer to the configuration section below
         },
     },

     {
         "vim-test/vim-test",
         config = function()
             require("plugins.vimtest")
         end,
     },

     {
         "mbbill/undotree",
         cmd = "UndotreeToggle",
     },

     { "junegunn/fzf", build = "./install --bin" },
     {
         "ibhagwan/fzf-lua",
         config = function()
             require("plugins.fzf") -- better lua version of fzf.vim
         end,
     },

     --{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
     {
         "nvim-telescope/telescope-fzf-native.nvim",
         build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
     },

     {
         "nvim-telescope/telescope.nvim",
         dependencies = {
             "nvim-telescope/telescope-fzf-native.nvim",
         },
         config = function()
             require("plugins.telescope")
         end,
     },

     { "liuchengxu/vista.vim" }, -- view and search lsp symbols

     {
         "RRethy/vim-illuminate",
         config = function()
             require("plugins.illuminate") -- highlights and allows moving between variable references
         end,
     },

     "jose-elias-alvarez/typescript.nvim",
     "yioneko/nvim-vtsls",

     {
         "jose-elias-alvarez/null-ls.nvim",
     },

     "ojroques/nvim-lspfuzzy", -- use fzf as lsp handler

     {
         "RRethy/nvim-treesitter-textsubjects", -- adds smart text objects
         ft = { "lua", "typescript", "typescriptreact" },
     },
     { "JoosepAlviste/nvim-ts-context-commentstring", ft = { "typescript", "typescriptreact" } }, -- makes jsx comments actually work

     {
         "onsails/lspkind-nvim",
         event = "BufRead",
         config = function()
             require("plugins.others").lspkind()
         end,
     },

     "rafamadriz/friendly-snippets",
     {
         "L3MON4D3/LuaSnip",
         config = function()
             require("plugins.luasnip")
         end,
     },

     "hrsh7th/cmp-nvim-lsp",
     "saadparwaiz1/cmp_luasnip",
     "hrsh7th/cmp-nvim-lua",
     -- "hrsh7th/vim-vsnip",
     "hrsh7th/cmp-buffer",
     {
         "hrsh7th/nvim-cmp",
         config = function()
             require("plugins.cmp")
         end,
     },

     {
         "lewis6991/gitsigns.nvim",
         config = function()
             require("plugins.gitsigns")
         end,
     },

     "tpope/vim-rails",
     "tpope/vim-rhubarb", -- Required for GBrowse

     {
         "tpope/vim-fugitive",
         event = { "BufRead", "BufNewFile" },
     },

     {
         "sindrets/diffview.nvim",
         cmd = {
             "DiffviewOpen",
             "DiffviewClose",
             "DiffviewToggleFiles",
             "DiffviewFocusFiles",
             "DiffviewRefresh",
         },
         config = function()
             require("plugins.diffview")
         end,
     },

     {
         "windwp/nvim-autopairs",
         config = function()
             require("plugins.autopairs")
         end,
     },

     "andymass/vim-matchup",

     {
         "terrortylor/nvim-comment",
         cmd = "CommentToggle",
         config = function()
             require("plugins.others").comment()
         end,
     },

     {
         "dstein64/vim-startuptime",
         cmd = "StartupTime",
     },

     {
         "Pocco81/TrueZen.nvim",
         cmd = {
             "TZAtaraxis",
             "TZMinimalist",
             "TZFocus",
         },
         config = function()
             require("plugins.zenmode")
         end,
     },
     {
         "lukas-reineke/indent-blankline.nvim",
         main = "ibl",
         opts = {},
         init = function()
             require("plugins.others").blankline()
         end,
     },
     {
         "kristijanhusak/orgmode.nvim",
         ft = { "org" },
         config = function()
             require("orgmode").setup({
                 org_hide_emphasis_markers = true,
                 org_highlight_latex_and_related = "entities",
             })
         end,
     },

     "mattn/webapi-vim",
     {
         "mattn/vim-gist",
         config = function()
             require("plugins.vim_gist")
         end,
     },

     {
         "TimUntersberger/neogit",
         cmd = "Neogit",
         config = function()
             require("plugins.neogit")
         end,
     },

     {
         "iamcco/markdown-preview.nvim",
         event = { "VimEnter", "BufReadPre" },
         build = "cd app && yarn install",
     },

     {
         "williamboman/mason.nvim",
         build = ":MasonUpdate",
         dependencies = {
             "williamboman/mason-lspconfig.nvim",
             "WhoIsSethDaniel/mason-tool-installer.nvim",
             "neovim/nvim-lspconfig",
         },
         config = function()
             require("lsp")
         end,
     },
     {
         "mrcjkb/rustaceanvim",
         version = "^4", -- Recommended
         ft = { "rust" },
     },
}
