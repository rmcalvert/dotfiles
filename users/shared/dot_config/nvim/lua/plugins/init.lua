return {
  "lewis6991/gitsigns.nvim",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  "nvim-tree/nvim-web-devicons",
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
      vim.cmd([[colorscheme catppuccin-mocha]])
    end,
  },
  "kylechui/nvim-surround",
  "windwp/nvim-autopairs",
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  "kevinhwang91/nvim-bqf", -- better quick fix
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      ----         folding = true;
      configs.setup({
        -- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
        ensure_installed = "all",
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    config = function()
      require("nvim-treesitter.configs").setup({
        refactor = {
          highlight_definitions = {
            enable = true,
            -- Set to false if you have an `updatetime` of ~100.
            clear_on_cursor_move = true,
          },
        },
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
        formatters_by_ft = {
          lua = { "stylua" },
          -- ruby = [ "rubocop" ];
          nix = { "nixfmt" },
          json = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
          javascript = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
          typescript = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
          typescriptreact = { "prettierd", "prettier", timeout_ms = 2000, stop_after_first = true },
          kotlin = { "ktfmt" },
        },
      })
    end,
  },
  {
    "mfussenegger/nvim-lint",
    "calops/hmts.nvim", -- highlighting embeded languages within nix
    config = function()
      require("lint").linters_by_ft = {
        markdown = { "vale" },
        text = { "vale" },
        dockerfile = { "hadolint" },
        json = { "jsonlint" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        kotlin = { "ktfmt" },
        -- rubocop = [ "rubocop" ];
        -- python = [ "pylint" ];
      }
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        extensions = { "fzf" },
        globalstatus = true,
        -- +-------------------------------------------------+
        -- | A | B | C                             X | Y | Z |
        -- +-------------------------------------------------+
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "filename", "diff" },
          lualine_x = {
            "diagnostics",

            -- Show active language server
            function()
              local msg = ""
              local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
              return msg
            end,
            {
              color = {
                fg = "#ffffff",
              },
            },

            -- Add macro recording status to lualine_x section
            -- function()
            -- 	local recording_register = vim.fn.reg_recording()
            -- 	if recording_register == "" then
            -- return "X"
            -- 	else
            -- 		return "Recording @" .. recording_register
            -- 	end
            -- end,
            {
              color = {
                fg = "#ff0000", -- Red color to make it noticeable
              },
            },
            "encoding",
            "fileformat",
            "filetype",
          },
        },
      })
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        lsp = {
          -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
          },
        },
        -- you can enable a preset for easier configuration
        presets = {
          bottom_search = true,         -- use a classic bottom cmdline for search
          command_palette = true,       -- position the cmdline and popupmenu together
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = false,           -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
      })
    end,
  },
  { "folke/trouble.nvim" },
  {
    "Saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      fuzzy = { implementation = "prefer_rust_with_warning" },
      completion = {
        accept = {
          auto_brackets = {
            enabled = true,
            semantic_token_resolution = {
              enabled = false,
            },
          },
        },
        documentation = {
          auto_show = true,
        },
      },
      keymap = {
        preset = "super-tab",
      },
      signature = {
        enabled = true,
      },
      sources = {
        default = {
          -- "avante",
          -- "codecompanion",
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
        providers = {
          -- avante = {
          -- module = "blink-cmp-avante";
          -- name = "Avante";
          -- opts = {
          -- -- options for blink-cmp-avante
          -- };
          -- };
          -- buffer = {
          --   score_offset = -7;
          -- };
          -- lsp = {
          --   fallbacks = [ ];
          -- };
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    -- 	config = function()
  },
  "kdheepak/lazygit.nvim",
  "f-person/git-blame.nvim",
  -- {
  -- 	"iamcco/markdown-preview.nvim",
  -- 	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  -- 	ft = { "markdown" },
  -- 	----         settings = {
  -- 	----           auto_close = 1;
  -- 	----           theme = "dark";
  -- 	----         };
  -- 	build = function()
  -- 		vim.fn["mkdp#util#install"]()
  -- 	end,
  -- },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          "fzf-native",
          "file-browser",
          "ui-select",
          "undo",
        },
      })
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      -- vim.keymap.set("n", "<leader>fg", require("custom.telescope.multi-ripgrep"))
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
      vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find)
      vim.keymap.set("n", "<space>gw", builtin.grep_string)
      vim.keymap.set("n", "<space>fa", function()
        ---@diagnostic disable-next-line: param-type-mismatch
        builtin.find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
      end)
    end,
    ----       };
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end
  },
  -- {
  --   "olimorris/codecompanion.nvim",
  --   opts = {},
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("codecompanion").setup({
  --       adapters = {
  --         lm_studio = function()
  --           return require("codecompanion.adapters").extend("openai_compatible", {
  --             env = {
  --               url = "http://127.0.0.1:1234",
  --             },
  --             --  schema = {
  --             --      model = {
  --             --          default = 'qwen2.5-coder:latest',
  --             --          -- default = "llama3.1:8b-instruct-q8_0",
  --             --      },
  --             --      num_ctx = {
  --             --          default = 32768,
  --             --      },
  --             --  },
  --           })
  --         end,
  --       },
  --       strategies = {
  --         chat = {
  --           adapter = "lm_studio",
  --         },
  --         inline = {
  --           adapter = "lm_studio",
  --         },
  --       },
  --     })
  --   end,
  -- },
  ----     plugins = {
  ----       # Includes all parsers for treesitter
  ----       # lsp-format.enable = true;
  ----       # mini = {
  ----       #   enable = true;
  ----       #   modules = {
  ----       #     files = { };
  ----       #   };
  ----       # };
  ----       # cmp = {
  ----       #   enable = true;
  ----       #   autoEnableSources = true;
  ----       #   settings.sources = [
  ----       #     { name = "nvim_lsp"; }
  ----       #     { name = "path"; }
  ----       #     { name = "buffer"; }
  ----       #   ];
  ----       # };
  ----
  ----       # https://github.com/nix-community/nixvim/issues/3028
  ----       nui = {
  ----         enable = true; # required be avante. :checkhealth avante shows as missing if not included
  ----         autoLoad = true; # required be avante. :checkhealth avante shows as missing if not included
  ----         lazyLoad.enable = false;
  ----       };
  ----
  ----       avante = {
  ----         enable = true;
  ----         settings = {
  ----           provider = "lm_studio";
  ----           vendors = {
  ----             lm_studio = {
  ----               __inherited_from = "openai";
  ----               api_key_name = "";
  ----               endpoint = "http://127.0.0.1:1234/v1";
  ----               # model = "codegemma";
  ----               model = "";
  ----               disable_tools = true; # Open-source models often do not support tools.
  ----             };
  ----           };
  ----         };
  ----       };
  ----     };
  ----     extraPlugins = [
  ----       (pkgs.vimUtils.buildVimPlugin {
  ----         name = "blink-cmp-avante";
  ----         src = pkgs.fetchFromGitHub {
  ----           owner = "Kaiser-Yang";
  ----           repo = "blink-cmp-avante";
  ----           rev = "bea97a08fe66cef0f93e953f908a4d00b0eca6b2";
  ----           hash = "sha256-1ltVpWN+JEAdC6g8IIGfTEpTflpuZ/jbN4ByXbjhPEU=";
  ----         };
  ----       })
  ----     ];
  ----   };
}
