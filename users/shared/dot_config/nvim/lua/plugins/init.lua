return {
	"lewis6991/gitsigns.nvim",
	{ "folke/which-key.nvim", lazy = true },
	"nvim-tree/nvim-web-devicons",
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- colorscheme catppuccin " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
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
				},
			})
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

						---- -- Show active language server
						---- function()
						---- 	local msg = ""
						---- 	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
						---- 	local clients = vim.lsp.get_clients()
						---- 	if next(clients) == nil then
						---- 		return msg
						---- 	end
						---- 	for _, client in ipairs(clients) do
						---- 		local filetypes = client.config.filetypes
						---- 		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
						---- 			return client.name
						---- 		end
						---- 	end
						---- 	return msg
						---- end,
						---- color = {
						---- 	fg = "#ffffff",
						---- },

						---- -- Add macro recording status to lualine_x section
						---- function()
						---- 	local recording_register = vim.fn.reg_recording()
						---- 	if recording_register == "" then
						---- 		return ""
						---- 	else
						---- 		return "Recording @" .. recording_register
						---- 	end
						---- end,

						---- color = {
						---- 	fg = "#ff0000", -- Red color to make it noticeable
						---- },
						"encoding",
						"fileformat",
						"filetype",
					},
				},
			})
		end,
	},
	{
		"Saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
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
					---"codecompanion",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},
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
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("nil_ls") -- nix
			vim.lsp.enable("nixd")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("cssls")
			----           lua_ls = {
			----             # Lua
			----             enable = true;
			----             settings.telemetry.enable = false;
			----           };
			----           #jnil_ls.enable = true;
			----           #jpyright.enable = true;
			----           #jpylsp.enable = true;
			----           #jtflint.enable = true;
			----           #jtempl.enable = true;
			----           html.enable = true;
			----           htmx.enable = true;
			----           tailwindcss.enable = true;
			----           # pyright.enable = true; # Python
			----           marksman.enable = true; # Markdown
			----           dockerls.enable = true; # Docker
			----           bashls.enable = true; # Bash
			----           clangd.enable = true; # C/C++
			----           solargraph = {
			----             enable = false;
			----             cmd = [
			----               "./bin/solargraph"
			----               "stdio"
			----             ];
			----           };
			----           ruby_lsp = {
			----             enable = true;
			----             package = null;
			----             cmd = [ "bin/ruby-lsp" ];
			----             settings = {
			----               init_options = {
			----                 addonSettings = {
			----                   "Ruby LSP Rails" = {
			----                     enablePendingMigrationsPrompt = true;
			----                   };
			----                 };
			----                 formatter = "standard";
			----                 linters = [ "standard" ];
			----               };
			----             };
			----           };
			----           sorbet = {
			----             enable = false;
			----             package = null;
			----             cmd = [
			----               "bin/srb"
			----               "tc"
			----               "--lsp"
			----             ];
			----           };
			----           yamlls.enable = true; # YAML
			----           gopls = {
			----             # Golang
			----             enable = true;
			----             autostart = true;
			----           };
			----
			----
			----           # Rust
			----           rust_analyzer = {
			----             enable = true;
			----             installRustc = true;
			----             installCargo = true;
			----           };
		end,
		----       lsp = {
		----         luaConfig.post = ''
		----           local capabilities = require('blink.cmp').get_lsp_capabilities()
		----           local lspconfig = require('lspconfig')
		----            lspconfig['ruby_lsp'].setup({ capabilities = capabilities })
		----         '';
		----         keymaps = {
		----           silent = true;
		----           diagnostic = {
		----             # Navigate in diagnostics
		----             "<leader>k" = "goto_prev";
		----             "<leader>j" = "goto_next";
		----           };
		----
		----           lspBuf = {
		----             gd = "definition";
		----             gD = "references";
		----             gt = "type_definition";
		----             gi = "implementation";
		----             K = "hover";
		----             "<F2>" = "rename";
		----           };
		----         };
		----
		----       };
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				markdown = { "vale" },
				text = { "vale" },
				dockerfile = { "hadolint" },
				json = { "jsonlint" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				-- rubocop = [ "rubocop" ];
				-- python = [ "pylint" ];
			}
		end,
	},

	----     plugins = {
	----       # Includes all parsers for treesitter
	----       # lsp-format.enable = true;
	----       nvim-bqf.enable = true;
	----       # mini = {
	----       #   enable = true;
	----       #   modules = {
	----       #     files = { };
	----       #   };
	----       # };
	----       noice = {
	----         enable = true;
	----         settings = {
	----           lsp = {
	----             override = {
	----               #     override markdown rendering so that **cmp** and other plugins use **Treesitter**
	----               "vim.lsp.util.convert_input_to_markdown_lines" = true;
	----               "vim.lsp.util.stylize_markdown" = true;
	----               "cmp.entry.get_documentation" = true; # requires hrsh7th/nvim-cmp
	----             };
	----           };
	----           presets = {
	----             bottom_search = true; # use a classic bottom cmdline for search
	----             command_palette = true; # position the cmdline and popupmenu together
	----             long_message_to_split = true; # long messages will be sent to a split
	----             inc_rename = false; # enables an input dialog for inc-rename.nvim
	----             lsp_doc_border = false; # add a border to hover docs and signature help
	----           };
	----         };
	----         # })
	----       };
	----       trouble.enable = true;
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
	----       codecompanion = {
	----         enable = true;
	----         settings = {
	----           adapters = {
	----             lm_studio = {
	----               __raw = ''
	----                 function()
	----                   return require('codecompanion.adapters').extend('openai_compatible', {
	----                       env = {
	----                           url = "http://127.0.0.1:1234",
	----                       },
	----                       --  schema = {
	----                       --      model = {
	----                       --          default = 'qwen2.5-coder:latest',
	----                       --          -- default = "llama3.1:8b-instruct-q8_0",
	----                       --      },
	----                       --      num_ctx = {
	----                       --          default = 32768,
	----                       --      },
	----                       --  },
	----                   })
	----                 end
	----               '';
	----             };
	----           };
	----           strategies = {
	----             chat = {
	----               adapter = "lm_studio";
	----             };
	----             inline = {
	----               adapter = "lm_studio";
	----             };
	----           };
	----         };
	----       };
	----       markdown-preview = {
	----         enable = true;
	----         settings = {
	----           auto_close = 1;
	----           theme = "dark";
	----         };
	----       };
	----       hmts.enable = true;
	----
	----       # none-ls = {
	----       #   enable = true;
	----       #   enableLspFormat = true;
	----       #   sources = {
	----       #     formatting = {
	----       #       nixfmt.enable = true;
	----       #       #rubocop.enable = true;
	----       #     };
	----       #     diagnostics = {
	----       #       semgrep.enable = true;
	----       #       rubocop.enable = true;
	----       #     };
	----       #   };
	----       # };
	----       lazygit = {
	----         enable = true;
	----       };
	----       gitblame = {
	----         enable = true;
	----       };
	----       telescope = {
	----         enable = true;
	----         extensions = {
	----           fzf-native.enable = true;
	----           file-browser.enable = true;
	----           ui-select.enable = true;
	----           undo.enable = true;
	----         };
	----         # vim.keymap.set("n", "<space>fh", builtin.help_tags)
	----         # vim.keymap.set("n", "<space>fg", require "custom.telescope.multi-ripgrep")
	----         # vim.keymap.set("n", "<space>fb", builtin.buffers)
	----         # vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
	----         #
	----         # vim.keymap.set("n", "<space>gw", builtin.grep_string)
	----         #
	----         # vim.keymap.set("n", "<space>fa", function()
	----         #   ---@diagnostic disable-next-line: param-type-mismatch
	----         #   builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
	----         # end)
	----         #
	----         # vim.keymap.set("n", "<space>en", function()
	----         #   builtin.find_files { cwd = vim.fn.stdpath "config" }
	----         # end)
	----         #
	----         # vim.keymap.set("n", "<space>eo", function()
	----         #   builtin.find_files { cwd = "~/.config/nvim-backup/" }
	----         # end)
	----         #
	----         # vim.keymap.set("n", "<space>fp", function()
	----         #   builtin.find_files { cwd = "~/plugins/" }
	----         # end)
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
