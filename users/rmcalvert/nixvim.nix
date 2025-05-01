{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    colorschemes.catppuccin.enable = true;
    opts = {
      # don't write to the ShaDa file on startup
      shadafile = "NONE";
      shiftwidth = 2; # Tab width 2
      ruler = true;
      hidden = true;
      smarttab = true;
      termguicolors = true;
      shiftround = true;
      ignorecase = true;
      magic = true;
      smartcase = true;
      infercase = true;
      incsearch = true;
      wrapscan = true;
      complete = ".,w,b,k";
      inccommand = "nosplit";
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --hidden --vimgrep --smart-case --";
      # breakat = [[\ \	;:,!?]];
      startofline = false;
      backspace = "indent,eol,start";
      diffopt = "filler,iwhite,internal,algorithm:patience";
      completeopt = "menu,menuone,noselect"; # specified by nvim-cmp;
      jumpoptions = "stack";
      whichwrap = "h,l,<,>,[,],~";
      switchbuf = "useopen";
      splitbelow = true;
      splitright = true;
      cul = true;
      # mouse = "a" -- "nv";
      signcolumn = "yes";
      colorcolumn = "80,120";
      errorbells = true;
      visualbell = true;
      fileformats = "unix,mac,dos";
      cmdheight = 1;
      virtualedit = "block";
      encoding = "utf-8";
      backup = false;
      writebackup = false;
      undofile = true;
      swapfile = false;
      wildignorecase = true;
      wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**";
      viewoptions = "folds,cursor,curdir,slash,unix";
      sessionoptions = "curdir,help,tabpages,winsize";
      updatetime = 250; # update interval for gitsigns;
      redrawtime = 1500;
      timeoutlen = 400;
      timeout = true;
      ttimeout = true;
      ttimeoutlen = 10;
      clipboard = "unnamedplus";
      scrolloff = 2;
      sidescrolloff = 5;
      foldlevelstart = 99;
      # lazyredraw = true;
      linebreak = true;
      wrap = false;
      # textwidth = 120;
      wildmenu = true;
      wildmode = "longest:list:full";
      list = true;
      showtabline = 0;
      #Jdirectory = global.cache_path .. "swag/";
      # undodir = global.cache_path .. "undo/";
      # backupdir = global.cache_path .. "backup/";
      # viewdir = global.cache_path .. "view/";
      # spellfile = global.cache_path .. "spell/en.uft-8.add";
      history = 2000;
      backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim";

      #  Numbers
      number = true;
      relativenumber = true;
      numberwidth = 2; # Make the line number column thinner

      #  for indentline
      expandtab = true;
      smartindent = true;

      winwidth = 30;
      winminwidth = 10;
      pumheight = 15;
      helpheight = 12;
      previewheight = 12;
      showcmd = false;
      cmdwinheight = 5;
      equalalways = false;
      laststatus = 3; # display single status line instead of one for each buffer
      display = "lastline";
      foldmethod = "indent";
      cursorline = true;
      cursorcolumn = false;
      showbreak = " ↳  ";
      listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←";
      pumblend = 20;
      winblend = 20;

      #  shortmess options
      #  shortmess:append("asI") # disable intro
      showmode = false;
      shortmess = "aoOTIcF";
    };
    keymaps = [
      # Insert esc
      {
        action = "<ESC>";
        key = "jk";
        mode = "i";
        options = {
          silent = true;
          noremap = true;
          desc = "ESC";
        };
      }
      {
        action = "<ESC>";
        key = "jk";
        mode = "c";
        options = {
          silent = true;
          noremap = true;
          desc = "ESC";
        };
      }
      # Open oil
      {
        action = "<CMD>Oil<CR>";
        key = "-";
        mode = "n";
        options = {
          silent = true;
          noremap = true;
          desc = "Open parent directory";
        };
      }
      # Open MiniFiles
      # {
      #   action = ":lua MiniFiles.open()<CR>";
      #   key = "-";
      #   mode = "n";
      #   options = {
      #     silent = true;
      #     noremap = true;
      #     desc = "Open MiniFiles";
      #   };
      # }
      # Go to definition
      {
        action = ":lua vim.lsp.buf.definition()<CR>";
        key = "<leader>gd";
        options = {
          silent = true;
          noremap = true;
          desc = "Go to definition";
        };
      }
      # Go to references
      {
        action = ":lua vim.lsp.buf.references()<CR>";
        key = "<leader>gr";
        options = {
          silent = true;
          noremap = true;
          desc = "Go to references";
        };
      }
      # Set quickfix list to LSP diagnostics
      {
        action = ":lua vim.diagnostic.setqflist()<CR>";
        key = "<leader>q";
        options = {
          silent = true;
          noremap = true;
          desc = "Diagnostic errors to quickfix list ";
        };
      }
      # git blame open URL
      {
        action = ":GitBlameOpenCommitURL<CR>";
        key = "<leader>gb";
        options = {
          silent = true;
          noremap = true;
          desc = "Open git blame URL";
        };
      }
      # lazy git dashboard
      {
        action = ":LazyGit<CR>";
        key = "<leader>lg";
        options = {
          silent = true;
          noremap = true;
          desc = "Open lazygit";
        };
      }
      # markdown preview mapping
      {
        action = ":MarkdownPreview<CR>";
        key = "<leader>pm";
        options = {
          silent = true;
          noremap = true;
          desc = "Open markdown preview in browser";
        };
      }
      # Telescope search (live grep)
      {
        action = ":Telescope live_grep<CR>";
        key = "<leader>fg";
        options = {
          silent = true;
          noremap = true;
          desc = "Search grep";
        };
      }
      # Telescope search buffers
      {
        action = ":Telescope buffers<CR>";
        key = "<leader>fb";
        options = {
          silent = true;
          noremap = true;
          desc = "Search buffers";
        };
      }
      # Foo buffer
      {
        action = ":Telescope current_buffer_fuzzy_find<CR>";
        key = "<leader>b";
        options = {
          silent = true;
          noremap = true;
          desc = "Search current buffer";
        };
      }
      # Telescope search commands
      {
        action = ":Telescope command_history<CR>";
        key = "<leader>fc";
        options = {
          silent = true;
          noremap = true;
          desc = "Search commands";
        };
      }
      # Telescope search files
      {
        action = ":Telescope find_files<CR>";
        key = "<leader>ff";
        options = {
          silent = true;
          noremap = true;
          desc = "Search files";
        };
      }
      # Telescope search commands
      {
        action = ":Telescope commands<CR>";
        key = "<leader>fc";
        options = {
          silent = true;
          noremap = true;
          desc = "Search commands";
        };
      }
      # Telescope diagnostics
      {
        action = ":Telescope diagnostics<CR>";
        key = "<leader>d";
        options = {
          silent = true;
          noremap = true;
          desc = "Diagnostics";
        };
      }
      # Telescope quickfixlist
      {
        action = ":Telescope quickfix<CR>";
        key = "<leader>ql";
        options = {
          silent = true;
          noremap = true;
          desc = "Qfickfix list";
        };
      }
      # Telescope quickfixlist
      {
        action = ":Telescope grep_string<CR>";
        key = "<leader>fw";
        options = {
          silent = true;
          noremap = true;
          desc = "Search current word";
        };
      }
      # map("n", "<S-k>", [[<Cmd>Telescope grep_string<CR>]], opt)
      # Bar undo tree
      {
        action = ":Telescope undo<CR>";
        key = "<leader>u";
        options = {
          silent = true;
          noremap = true;
          desc = "Undo tree";
        };
      }
      # Diffview open comparing in git
      {
        action = ":DiffviewOpen<CR>";
        key = "<leader>do";
        options = {
          silent = true;
          noremap = true;
          desc = "Diffview open";
        };
      }
      # Diffview close comparing in git
      {
        action = ":DiffviewClose<CR>";
        key = "<leader>dp";
        options = {
          silent = true;
          noremap = true;
          desc = "Diffview close";
        };
      }
      # Mapping q for recording macros
      {
        action = "q";
        key = "q";
        options = {
          silent = true;
          noremap = true;
        };
      }

      # Mapping Ctrl+V for block visual mode
      {
        action = "<C-v>";
        key = "<C-v>";
        options = {
          silent = true;
          noremap = true;
        };
      }

      {
        action = "<cmd>CodeCompanionActions<cr>";
        key = "<C-a>";
        mode = [
          "n"
          "v"
        ];
        options = {
          silent = true;
          noremap = true;
        };
      }

      {
        action = "<cmd>CodeCompanionChat Toggle<cr>";
        key = "<LocalLeader>a";
        mode = [
          "n"
          "v"
        ];
        options = {
          silent = true;
          noremap = true;
        };
      }

      {
        action = "<cmd>CodeCompanionChat Add<cr>";
        key = "ga";
        mode = "v";
        options = {
          silent = true;
          noremap = true;
        };
      }

      # Buffers
      # {
      #   action = ":BufferNext<CR>";
      #   key = "<Tab>";
      #   options = {
      #     silent = true;
      #     noremap = true;
      #     desc = "Next buffer";
      #   };
      # }

      # {
      #   action = ":BufferPrevious<CR>";
      #   key = "<S-Tab>";
      #   options = {
      #     silent = true;
      #     noremap = true;
      #     desc = "Prev buffer";
      #   };
      # }
    ];
    plugins = {
      nix.enable = true;
      web-devicons.enable = true;
      # Includes all parsers for treesitter
      # lsp-format.enable = true;
      which-key = {
        enable = true;
      };
      gitsigns = {
        enable = true;
      };
      nvim-surround.enable = true;
      nvim-autopairs.enable = true;
      nvim-bqf.enable = true;
      oil.enable = true;
      # mini = {
      #   enable = true;
      #   modules = {
      #     files = { };
      #   };
      # };
      noice = {
        enable = true;
        settings = {
          lsp = {
            override = {
              #     override markdown rendering so that **cmp** and other plugins use **Treesitter**
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
              "cmp.entry.get_documentation" = true; # requires hrsh7th/nvim-cmp
            };
          };
          presets = {
            bottom_search = true; # use a classic bottom cmdline for search
            command_palette = true; # position the cmdline and popupmenu together
            long_message_to_split = true; # long messages will be sent to a split
            inc_rename = false; # enables an input dialog for inc-rename.nvim
            lsp_doc_border = false; # add a border to hover docs and signature help
          };
        };
        # })
      };
      blink-cmp = {
        enable = true;
        settings = {
          #   appearance = {
          #     nerd_font_variant = "normal";
          #     use_nvim_cmp_as_default = false;
          #   };
          completion = {
            accept = {
              auto_brackets = {
                enabled = true;
                semantic_token_resolution = {
                  enabled = false;
                };
              };
            };
            documentation = {
              auto_show = true;
            };
          };
          keymap = {
            preset = "super-tab";
          };
          signature = {
            enabled = true;
          };
          sources = {
            cmdline = [ ];
            default = [
              "avante"
              "codecompanion"
              "lsp"
              "path"
              "snippets"
              "buffer"
            ];
            providers = {
              avante = {
                module = "blink-cmp-avante";
                name = "Avante";
                opts = {
                  # options for blink-cmp-avante
                };
              };
              # buffer = {
              #   score_offset = -7;
              # };
              # lsp = {
              #   fallbacks = [ ];
              # };
            };
          };
        };
      };
      trouble.enable = true;
      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            # These options will be passed to conform.format()
            timeout_ms = 500;
            lsp_format = "fallback";
          };
          formatters_by_ft = {
            # ruby = [ "rubocop" ];
            nix = [ "nixfmt" ];
            json = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              timeout_ms = 2000;
              stop_after_first = true;
            };
            javascript = {
              __unkeyed-1 = "prettierd";
              __unkeyed-2 = "prettier";
              timeout_ms = 2000;
              stop_after_first = true;
            };
          };
        };
      };
      lint = {
        enable = true;
        lintersByFt = {
          text = [ "vale" ];
          markdown = [ "vale" ];
          dockerfile = [ "hadolint" ];
          json = [ "jsonlint" ];
          javascript = [ "eslint_d" ];
          typescript = [ "eslint_d" ];

          # rubocop = [ "rubocop" ];
          # python = [ "pylint" ];
        };
      };
      # cmp = {
      #   enable = true;
      #   autoEnableSources = true;
      #   settings.sources = [
      #     { name = "nvim_lsp"; }
      #     { name = "path"; }
      #     { name = "buffer"; }
      #   ];
      # };

      # https://github.com/nix-community/nixvim/issues/3028
      nui = {
        enable = true; # required be avante. :checkhealth avante shows as missing if not included
        autoLoad = true; # required be avante. :checkhealth avante shows as missing if not included
        lazyLoad.enable = false;
      };

      avante = {
        enable = true;
        settings = {
          provider = "lm_studio";
          vendors = {
            lm_studio = {
              __inherited_from = "openai";
              api_key_name = "";
              endpoint = "http://127.0.0.1:1234/v1";
              # model = "codegemma";
              model = "";
              disable_tools = true; # Open-source models often do not support tools.
            };
          };
        };
      };
      codecompanion = {
        enable = true;
        settings = {
          adapters = {
            lm_studio = {
              __raw = ''
                function()
                  return require('codecompanion.adapters').extend('openai_compatible', {
                      env = {
                          url = "http://127.0.0.1:1234",
                      },
                      --  schema = {
                      --      model = {
                      --          default = 'qwen2.5-coder:latest',
                      --          -- default = "llama3.1:8b-instruct-q8_0",
                      --      },
                      --      num_ctx = {
                      --          default = 32768,
                      --      },
                      --  },
                  })
                end
              '';
            };
          };
          strategies = {
            chat = {
              adapter = "lm_studio";
            };
            inline = {
              adapter = "lm_studio";
            };
          };
        };
      };
      lualine = {
        enable = true;

        settings = {
          extensions = [ "fzf" ];
          globalstatus = true;

          # +-------------------------------------------------+
          # | A | B | C                             X | Y | Z |
          # +-------------------------------------------------+
          sections = {
            lualine_a = [ "mode" ];
            lualine_b = [ "branch" ];
            lualine_c = [
              "filename"
              "diff"
            ];

            lualine_x = [
              "diagnostics"

              # Show active language server
              {
                __raw = ''
                  function()
                      local msg = ""
                      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
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
                  end
                '';
                color = {
                  fg = "#ffffff";
                };
              }

              # Add macro recording status to lualine_x section
              {
                __raw = ''
                  function()
                      local recording_register = vim.fn.reg_recording()
                      if recording_register == "" then
                                return ""
                      else
                            return "Recording @" .. recording_register
                      end
                  end
                '';
                color = {
                  fg = "#ff0000"; # Red color to make it noticeable
                };
              }
              "encoding"
              "fileformat"
              "filetype"
            ];
          };
        };
      };
      markdown-preview = {
        enable = true;
        settings = {
          auto_close = 1;
          theme = "dark";
        };
      };
      treesitter = {
        enable = true;

        nixvimInjections = true;

        folding = true;
        settings = {
          indent.enable = true;
          highlight.enable = true;
          ensure_installed = "all";
          auto_install = true;
        };
      };

      treesitter-refactor = {
        enable = true;
        highlightDefinitions = {
          enable = true;
          # Set to false if you have an `updatetime` of ~100.
          clearOnCursorMove = false;
        };
      };

      hmts.enable = true;

      # none-ls = {
      #   enable = true;
      #   enableLspFormat = true;
      #   sources = {
      #     formatting = {
      #       nixfmt.enable = true;
      #       #rubocop.enable = true;
      #     };
      #     diagnostics = {
      #       semgrep.enable = true;
      #       rubocop.enable = true;
      #     };
      #   };
      # };
      lsp = {
        enable = true;
        luaConfig.post = ''
          -- FOO
          -- vim.lsp.log.error("CONFIGING STUFFFFFF")
          --        vim.lsp.log.error("CONFIGING STUFFFFFF")
          --        vim.lsp.log.error("CONFIGING STUFFFFFF")
          --        vim.lsp.log.error("CONFIGING STUFFFFFF")
          local capabilities = require('blink.cmp').get_lsp_capabilities()
          local lspconfig = require('lspconfig')
          lspconfig['ruby_lsp'].setup({ capabilities = capabilities })
        '';
        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          #jgopls.enable = true;
          #jgolangci_lint_ls.enable = true;
          nil_ls.enable = true; # Nix
          nixd.enable = true;
          #jnil_ls.enable = true;
          #jpyright.enable = true;
          #jpylsp.enable = true;
          #jtflint.enable = true;
          #jtempl.enable = true;
          html.enable = true;
          htmx.enable = true;
          tailwindcss.enable = true;
          ts_ls.enable = true; # TS/JS
          cssls.enable = true; # CSS
          # pyright.enable = true; # Python
          marksman.enable = true; # Markdown
          dockerls.enable = true; # Docker
          bashls.enable = true; # Bash
          clangd.enable = true; # C/C++
          solargraph = {
            enable = false;
            cmd = [
              "./bin/solargraph"
              "stdio"
            ];
          };
          ruby_lsp = {
            enable = true;
            # cmd = [ "ruby-lsp" ];
            package = null;
            extraOptions = {
              init_options = {
                formatter = "standard";
                linters = [ "standard" ];
              };
            };
          };
          sorbet = {
            enable = true;
            package = null;
            cmd = [
              "./bin/srb"
              "tc"
              "--lsp"
            ];
          };
          yamlls.enable = true; # YAML
          gopls = {
            # Golang
            enable = true;
            autostart = true;
          };

          lua_ls = {
            # Lua
            enable = true;
            settings.telemetry.enable = false;
          };

          # Rust
          rust_analyzer = {
            enable = true;
            installRustc = true;
            installCargo = true;
          };
        };
      };
      lazygit = {
        enable = true;
      };
      gitblame = {
        enable = true;
      };
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          file-browser.enable = true;
          ui-select.enable = true;
          undo.enable = true;
        };
        # vim.keymap.set("n", "<space>fh", builtin.help_tags)
        # vim.keymap.set("n", "<space>fg", require "custom.telescope.multi-ripgrep")
        # vim.keymap.set("n", "<space>fb", builtin.buffers)
        # vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
        #
        # vim.keymap.set("n", "<space>gw", builtin.grep_string)
        #
        # vim.keymap.set("n", "<space>fa", function()
        #   ---@diagnostic disable-next-line: param-type-mismatch
        #   builtin.find_files { cwd = vim.fs.joinpath(vim.fn.stdpath "data", "lazy") }
        # end)
        #
        # vim.keymap.set("n", "<space>en", function()
        #   builtin.find_files { cwd = vim.fn.stdpath "config" }
        # end)
        #
        # vim.keymap.set("n", "<space>eo", function()
        #   builtin.find_files { cwd = "~/.config/nvim-backup/" }
        # end)
        #
        # vim.keymap.set("n", "<space>fp", function()
        #   builtin.find_files { cwd = "~/plugins/" }
        # end)
      };
    };
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "blink-cmp-avante";
        src = pkgs.fetchFromGitHub {
          owner = "Kaiser-Yang";
          repo = "blink-cmp-avante";
          rev = "bea97a08fe66cef0f93e953f908a4d00b0eca6b2";
          hash = "sha256-1ltVpWN+JEAdC6g8IIGfTEpTflpuZ/jbN4ByXbjhPEU=";
        };
      })
    ];
  };
  #   programs.nvf = {
  #     settings = {
  #       vim = {
  #         viAlias = true;
  #         vimAlias = true;
  #         debugMode = {
  #           enable = false;
  #           level = 16;
  #           logFile = "/tmp/nvim.log";
  #         };
  #
  #         spellcheck = {
  #           enable = true;
  #         };
  #
  #         lsp = {
  #           formatOnSave = true;
  #           lspkind.enable = false;
  #           lightbulb.enable = true;
  #           lspsaga.enable = false;
  #           lspSignature.enable = true;
  #           otter-nvim.enable = true;
  #           lsplines.enable = true;
  #           nvim-docs-view.enable = true;
  #         };
  #
  #         debugger = {
  #           nvim-dap = {
  #             enable = true;
  #             ui.enable = true;
  #           };
  #         };
  #
  #         # This section does not include a comprehensive list of available language modules.
  #         # To list all available language module options, please visit the nvf manual.
  #         languages = {
  #           enableLSP = true;
  #           enableFormat = true;
  #           enableTreesitter = true;
  #           enableExtraDiagnostics = true;
  #
  #           # Languages that will be supported in default and maximal configurations.
  #           nix.enable = true;
  #           markdown.enable = true;
  #
  #           # Languages that are enabled in the maximal configuration.
  #           bash.enable = true;
  #           clang.enable = true;
  #           css.enable = true;
  #           html.enable = true;
  #           # sql.enable = true;
  #           # java.enable = true;
  #           kotlin.enable = true;
  #           ts.enable = true;
  #           go.enable = true;
  #           lua.enable = true;
  #           # zig.enable = true;
  #           # python.enable = true;
  #           # typst.enable = true;
  #           rust = {
  #             enable = true;
  #             crates.enable = true;
  #           };
  #
  #           # Language modules that are not as common.
  #           # assembly.enable = false;
  #           # astro.enable = false;
  #           # nu.enable = false;
  #           # csharp.enable = false;
  #           # julia.enable = false;
  #           # vala.enable = false;
  #           scala.enable = false;
  #           r.enable = false;
  #           gleam.enable = false;
  #           dart.enable = false;
  #           ocaml.enable = false;
  #           elixir.enable = false;
  #           haskell.enable = false;
  #           ruby.enable = false;
  #
  #           tailwind.enable = false;
  #           svelte.enable = false;
  #
  #           # Nim LSP is broken on Darwin and therefore
  #           # should be disabled by default. Users may still enable
  #           # `vim.languages.vim` to enable it, this does not restrict
  #           # that.
  #           # See: <https://github.com/PMunch/nimlsp/issues/178#issue-2128106096>
  #           nim.enable = false;
  #         };
  #
  #         visuals = {
  #           nvim-scrollbar.enable = true;
  #           nvim-web-devicons.enable = true;
  #           nvim-cursorline.enable = true;
  #           cinnamon-nvim.enable = false;
  #           fidget-nvim.enable = true;
  #
  #           highlight-undo.enable = true;
  #           indent-blankline.enable = true;
  #
  #           # Fun
  #           cellular-automaton.enable = false;
  #         };
  #
  #         statusline = {
  #           lualine = {
  #             enable = true;
  #             theme = "catppuccin";
  #           };
  #         };
  #
  #         theme = {
  #           enable = true;
  #           name = "catppuccin";
  #           style = "mocha";
  #           transparent = false;
  #         };
  #
  #         autocomplete.nvim-cmp.enable = true;
  #         snippets.luasnip.enable = true;
  #
  #         filetree = {
  #           neo-tree = {
  #             enable = true;
  #           };
  #         };
  #
  #         tabline = {
  #           nvimBufferline.enable = true;
  #         };
  #
  #         treesitter.context.enable = true;
  #
  #         binds = {
  #           whichKey.enable = true;
  #           cheatsheet.enable = true;
  #         };
  #
  #
  #         git = {
  #           enable = true;
  #           gitsigns.enable = true;
  #           gitsigns.codeActions.enable = false; # throws an annoying debug message
  #         };
  #
  #         minimap = {
  #           minimap-vim.enable = false;
  #           codewindow.enable = true; # lighter, faster, and uses lua for configuration
  #         };
  #
  #         dashboard = {
  #           dashboard-nvim.enable = false;
  #           alpha.enable = true;
  #         };
  #
  #         notify = {
  #           nvim-notify.enable = true;
  #         };
  #
  #         projects = {
  #           project-nvim.enable = true;
  #         };
  #
  #         utility = {
  #           ccc.enable = false;
  #           vim-wakatime.enable = false;
  #           icon-picker.enable = true;
  #           surround.enable = true;
  #           diffview-nvim.enable = true;
  #           yanky-nvim.enable = false;
  #           motion = {
  #             hop.enable = true;
  #             leap.enable = true;
  #             precognition.enable = false;
  #           };
  #
  #           images = {
  #             image-nvim.enable = false;
  #           };
  #         };
  #
  #         notes = {
  #           obsidian.enable = false; # FIXME: neovim fails to build if obsidian is enabled
  #           neorg.enable = false;
  #           orgmode.enable = false;
  #           mind-nvim.enable = true;
  #           todo-comments.enable = true;
  #         };
  #
  #         terminal = {
  #           toggleterm = {
  #             enable = true;
  #             lazygit.enable = true;
  #           };
  #         };
  #
  #         ui = {
  #           borders.enable = true;
  #           noice.enable = true;
  #           colorizer.enable = true;
  #           modes-nvim.enable = false; # the theme looks terrible with catppuccin
  #           illuminate.enable = true;
  #           breadcrumbs = {
  #             enable = true;
  #             navbuddy.enable = true;
  #           };
  #           smartcolumn = {
  #             enable = true;
  #             setupOpts.custom_colorcolumn = {
  #               # this is a freeform module, it's `buftype = int;` for configuring column position
  #               nix = "110";
  #               ruby = "120";
  #               java = "130";
  #               go = ["90" "130"];
  #             };
  #           };
  #           fastaction.enable = true;
  #         };
  #
  #         assistant = {
  #           chatgpt.enable = false;
  #           copilot = {
  #             enable = false;
  #             cmp.enable = true;
  #           };
  #         };
  #
  #         session = {
  #           nvim-session-manager.enable = false;
  #         };
  #
  #         gestures = {
  #           gesture-nvim.enable = false;
  #         };
  #
  #         comments = {
  #           comment-nvim.enable = true;
  #         };
  #
  #         presence = {
  #           neocord.enable = false;
  #         };
  #       };
  #     };
  #   };
  # home.file.".config/nvim/init.lua".source = ../../dot_config/nvim/init.lua;
  # home.file.".config/nvim/lua" = {
  #   source = ../../dot_config/nvim;
  #   recursive = true;
  # };

  # home.activation.mkdirNvimFolders = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #   mkdir -p $HOME/.config/nvim/backups $HOME/.config/nvim/swaps $HOME/.config/nvim/undo
  # '';

  # programs.nixvim = {
  #   enable = true;
  #   defaultEditor = true;
  # };

  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;

  #   extraLuaConfig = ''
  #     ${builtins.readFile ./config/lazy.lua}
  #     ${builtins.readFile ./lua/global.lua}
  #     ${builtins.readFile ./lua/options.lua}
  #     ${builtins.readFile ./lua/pluginList.lua}
  #     ${builtins.readFile ./lua/mappings.lua}
  #     ${builtins.readFile ./lua/utils.lua}
  #   '';
  #   # lib.fileContents ../../dot_confignvim/init.lua;

  #   plugins = with pkgs.vimPlugins; [
  #     # =======================================================================
  #     # UI AND THEMES
  #     # =======================================================================
  #     {
  #       plugin = zenbones-nvim; # Minimalist theme I love.
  #       type = "lua";
  #       config = ''
  #       vim.g.zenbones = {
  #         solid_line_nr    = true,
  #         solid_vert_split = true,
  #       }
  #       vim.cmd.colorscheme "zenbones"
  #       '';
  #     }
  #     # {
  #     #   plugin = pkgs.vimUtils.buildVimPlugin {
  #     #     name = "auto-dark-mode-nvim"; # switch vim color with OS theme
  #     #     src = pkgs.fetchFromGitHub {
  #     #       owner = "f-person";
  #     #       repo = "auto-dark-mode.nvim";
  #     #       rev = "14cad96b80a07e9e92a0dcbe235092ed14113fb2";
  #     #       hash = "sha256-bSkS2IDkRMQCjaePFYtq39Bokgd1Bwoxgu2ceP7Bh5s=";
  #     #     };
  #     #   };
  #     #   type = "lua";
  #     #   config = ''
  #     #   require('auto-dark-mode').setup({
  #     #     update_interval = 1000,
  #     #     set_dark_mode = function()
  #     #       vim.o.background = 'dark'
  #     #     end,
  #     #     set_light_mode = function()
  #     #       vim.o.background = 'light'
  #     #     end,
  #     #   })
  #     #   '';
  #     # }
  #     lush-nvim # Required by zenbones for all the colors
  #     # {
  #     #   plugin = zen-mode-nvim; # Create minimalist prose writing environment
  #     #   type = "lua";
  #     #   config = ''
  #     #   -- I write prose in markdown, all the following is to help with that.
  #     #   function _G.toggleProse()
  #     #     require("zen-mode").toggle({
  #     #       window = {
  #     #         backdrop = 1,
  #     #         width = 80
  #     #       },
  #     #       plugins = {
  #     #         gitsigns = { enabled = true },
  #     #         tmux = { enabled = true }
  #     #       },
  #     #       on_open = function()
  #     #         if (vim.bo.filetype == "markdown" or vim.bo.filetype == "telekasten") then
  #     #           vim.o.scrolloff = 999
  #     #           vim.o.relativenumber = false
  #     #           vim.o.number = false
  #     #           vim.o.wrap = true
  #     #           vim.o.linebreak = true
  #     #           vim.o.colorcolumn = "0"

  #     #           vim.keymap.set('n', 'j', 'gj', {noremap = true, buffer = true})
  #     #           vim.keymap.set('n', 'k', 'gk', {noremap = true, buffer = true})
  #     #         end
  #     #       end,
  #     #       on_close = function()
  #     #         vim.o.scrolloff = 3
  #     #         vim.o.relativenumber = true
  #     #         if (vim.bo.filetype == "markdown" or vim.bo.filetype == "telekasten") then
  #     #           vim.o.wrap = false
  #     #           vim.o.linebreak = false
  #     #           vim.o.colorcolumn = "80"
  #     #         end

  #     #         vim.keymap.set('n', 'j', 'j', {noremap = true, buffer = true})
  #     #         vim.keymap.set('n', 'k', 'k', {noremap = true, buffer = true})
  #     #       end
  #     #     })
  #     #   end

  #     #   vim.keymap.set(
  #     #     'n',
  #     #     '<space>m',
  #     #     ':lua _G.toggleProse()<cr>',
  #     #     {noremap = true, silent = true, desc = "Toggle Writing Mode"}
  #     #   )
  #     #   '';
  #     # }
  #     # {
  #     #   plugin = render-markdown-nvim; # Display markdown including docs
  #     #   type = "lua";
  #     #   config = ''
  #     #   require("render-markdown").setup({
  #     #     checkbox = {
  #     #       custom = {
  #     #         todo = { raw = "[-]", rendered = "󰜺", highlight = "RenderMarkdownCancelled" },
  #     #         cancelled = { raw = '[-]', rendered = '󰜺 ', highlight = 'RenderMarkdownTodo' },
  #     #         incomplete = { raw = '[/]', rendered = '󰦖 ', highlight = 'RenderMarkdownTodo' },
  #     #         forwarded = { raw = "[>]", rendered = "", highlight = "RenderMarkdownForwarded" },
  #     #         scheduled = { raw = "[<]", rendered = "󰸘", highlight = "RenderMarkdownScheduled" },
  #     #       }
  #     #     }
  #     #   })
  #     #   '';
  #     # }
  #     # # =======================================================================
  #     # # TREESITTER
  #     # # =======================================================================
  #     # {
  #     #   plugin = nvim-treesitter.withAllGrammars; # Treesitter
  #     #   type = "lua";
  #     #   config = ''
  #     #   require'nvim-treesitter.configs'.setup {
  #     #     highlight = { enable = true, },
  #     #     indent = { enable = true },
  #     #   }
  #     #   '';
  #     # }
  #     # {
  #     #   plugin = nvim-treesitter-textobjects; # helix-style selection of TS tree
  #     #   type = "lua";
  #     #   config = ''
  #     #   require'nvim-treesitter.configs'.setup {
  #     #     incremental_selection = {
  #     #       enable = true,
  #     #       keymaps = {
  #     #         init_selection = "<M-o>",
  #     #         scope_incremental = "<M-O>",
  #     #         node_incremental = "<M-o>",
  #     #         node_decremental = "<M-i>",
  #     #       },
  #     #     },
  #     #   }
  #     #   '';
  #     # }
  #     # =======================================================================
  #     # UTILITIES AND MINI
  #     # =======================================================================
  #     {
  #        plugin = mini-nvim; # Ridiculously complete family of plugins
  #        type = "lua";
  #       config = ''
  #        local opts = function(label)
  #          return {noremap = true, silent = true, desc = label}
  #        end
  #     --#   require('mini.ai').setup()         -- a/i textobjects
  #     --#   require('mini.align').setup()      -- aligning
  #     --#   require('mini.bracketed').setup()  -- unimpaired bindings with TS
  #     --#   require('mini.diff').setup()       -- hunk management and highlight
  #     --#   require('mini.extra').setup()      -- extra p}ickers
  #        require('mini.files').setup()      -- file manipulation
  #        local oil_style = function()
  #          if not MiniFiles.close() then
  #            MiniFiles.open(vim.api.nvim_buf_get_name(0))
  #            MiniFiles.reveal_cwd()
  #          end
  #        end
  #        vim.keymap.set('n', '-', oil_style, opts("File Explorer"));
  #     --#   local hipatterns = require('mini.hipatterns')
  #     --#   hipatterns.setup({  -- highlight strings and colors
  #     --#     highlighters = {
  #     --#       -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
  #     --#       fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
  #     --#       hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
  #     --#       todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
  #     --#       note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

  #     --#       -- Highlight hex color strings (`#rrggbb`) using that color
  #     --#       hex_color = hipatterns.gen_highlighter.hex_color(),
  #     --#     }
  #     --#   })
  #     --#   require('mini.operators').setup()
  #     --#   require('mini.icons').setup()      -- minimal icons
  #     --#   require('mini.jump').setup()       -- fFtT work past a line
  #     --#   local MiniJump2d = require('mini.jump2d').setup({
  #     --#     view = {
  #     --#       dim = true
  #     --#     },
  #     --#     mappings = {
  #     --#       start_jumping = ""
  #     --#     }
  #     --#   })
  #     --#   vim.keymap.set('n', 'gw', "<cmd>:lua MiniJump2d.start(MiniJump2d.builtin_opts.single_character)<cr>", opts("Jump to Word"))
  #     --#   require('mini.pairs').setup()      -- pair brackets
  #     --#   require('mini.pick').setup({
  #     --#     mappings = {
  #     --#       choose_marked = '<M-x>'
  #     --#     }
  #     --#   })       -- pickers
  #     --#   MiniPick.registry.files_root = function(local_opts)
  #     --#     local root_patterns = { ".git" }
  #     --#     local root_dir = vim.fs.dirname(vim.fs.find(root_patterns, { upward = true })[1])
  #     --#     local opts = { source = { cwd = root_dir } }
  #     --#     local_opts.cwd = root_dir -- nil?
  #     --#     return MiniPick.builtin.files(local_opts, opts)
  #     --#   end
  #     --#   vim.keymap.set('n', '<space>/', "<cmd>Pick grep_live<cr>", opts("Live Grep"))
  #     --#   vim.keymap.set('n', '<space>F', "<cmd>Pick files tool='git'<cr>", opts("Find Files in CWD"))
  #     --#   vim.keymap.set('n', '<space>f', "<cmd>Pick files_root tool='git'<cr>", opts("Find Files"))
  #     --#   vim.keymap.set('n', '<space>b', "<cmd>Pick buffers<cr>", opts("Buffers"))
  #     --#   vim.keymap.set('n', "<space>'", "<cmd>Pick resume<cr>", opts("Last Picker"))
  #     --#   vim.keymap.set('n', "<space>g", "<cmd>Pick git_commits<cr>", opts("Git Commits"))
  #     --#   vim.keymap.set('n', "<space>z", "<cmd>lua MiniPick.builtin.files(nil, {source={cwd=vim.fn.expand('~/src/wiki')}})<cr>", opts("Wiki"))
  #     --#   require('mini.statusline').setup() -- minimal statusline
  #       require('mini.surround').setup()
  #     --#   require('mini.splitjoin').setup()  -- work with parameters
  #     --#   local miniclue = require('mini.clue')
  #     --#   miniclue.setup({                   -- cute prompts about bindings
  #     --#     triggers = {
  #     --#       { mode = 'n', keys = '<Leader>' },
  #     --#       { mode = 'x', keys = '<Leader>' },
  #     --#       { mode = 'n', keys = '<space>' },
  #     --#       { mode = 'x', keys = '<space>' },

  #     --#       -- Built-in completion
  #     --#       { mode = 'i', keys = '<C-x>' },

  #     --#       -- `g` key
  #     --#       { mode = 'n', keys = 'g' },
  #     --#       { mode = 'x', keys = 'g' },

  #     --#       -- Marks
  #     --#       { mode = 'n', keys = "'" },
  #     --#       { mode = 'n', keys = '`' },
  #     --#       { mode = 'x', keys = "'" },
  #     --#       { mode = 'x', keys = '`' },

  #     --#       -- Registers
  #     --#       { mode = 'n', keys = '"' },
  #     --#       { mode = 'x', keys = '"' },
  #     --#       { mode = 'i', keys = '<C-r>' },
  #     --#       { mode = 'c', keys = '<C-r>' },

  #     --#       -- Window commands
  #     --#       { mode = 'n', keys = '<C-w>' },

  #     --#       -- `z` key
  #     --#       { mode = 'n', keys = 'z' },
  #     --#       { mode = 'x', keys = 'z' },

  #     --#       -- Bracketed
  #     --#       { mode = 'n', keys = '[' },
  #     --#       { mode = 'n', keys = ']' },
  #     --#     },
  #     --#     clues = {
  #     --#       miniclue.gen_clues.builtin_completion(),
  #     --#       miniclue.gen_clues.g(),
  #     --#       miniclue.gen_clues.marks(),
  #     --#       miniclue.gen_clues.registers(),
  #     --#       miniclue.gen_clues.windows(),
  #     --#       miniclue.gen_clues.z(),
  #     --#     },
  #     --#   })
  #       '';
  #     }
  #     # targets-vim     # Classic text-objects
  #     # vim-eunuch      # powerful buffer-level file options
  #     # vim-ragtag      # print/execute bindings for template files
  #     # vim-speeddating # incrementing dates and times
  #     # vim-fugitive    # :Git actions
  #     # vim-rhubarb     # github plugins for fugitive
  #     # # =======================================================================
  #     # # LSP AND COMPLETION
  #     # # =======================================================================
  #     # {
  #     #   plugin = nvim-lspconfig; # Interface for LSPs
  #     #   type = "lua";
  #     #   config = lib.fileContents ./lsp.lua;
  #     # }
  #   ];
  # };
}
