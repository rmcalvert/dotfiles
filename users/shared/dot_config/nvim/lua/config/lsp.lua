-- LSP configuration with conditional loading based on filetype
local function setup_lsp_for_filetype(ft)
  if ft == "lua" then
    vim.lsp.enable("lua_ls")
  elseif ft == "nix" then
    vim.lsp.enable("nil_ls")
    vim.lsp.enable("nixd")
  elseif ft == "javascript" or ft == "typescript" or ft == "javascriptreact" or ft == "typescriptreact" then
    vim.lsp.enable("ts_ls")
  elseif ft == "css" or ft == "scss" or ft == "less" then
    vim.lsp.enable("cssls")
  elseif ft == "html" then
    vim.lsp.enable("html")
  elseif ft == "kotlin" then
    vim.lsp.enable("kotlin")
    vim.lsp.config("kotlin", {
      cmd = vim.lsp.rpc.connect('127.0.0.1', 9999),
      single_file_support = true,
      filetypes = { 'kotlin' },
      root_markers = { 'build.gradle', 'build.gradle.kts', 'pom.xml' },
    })
  elseif ft == "python" then
    vim.lsp.enable("pyright")
    vim.lsp.config("pyright", {
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "basic",
            autoImportCompletions = true,
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            completeFunctionParens = true,
            indexing = true,
            packageIndexDepths = {
              {
                name = "",
                depth = 2,
                includeAllSymbols = true
              }
            }
          }
        },
        pyright = {
          disableOrganizeImports = false,
        }
      },
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    })
  elseif ft == "markdown" then
    vim.lsp.enable("marksman")
  elseif ft == "dockerfile" then
    vim.lsp.enable("dockerls")
  elseif ft == "sh" or ft == "bash" then
    vim.lsp.enable("bashls")
  elseif ft == "ruby" then
    vim.lsp.enable("ruby_lsp")
    vim.lsp.config("ruby_lsp", {
      cmd = { "bin/ruby-lsp" },
      settings = {
        init_options = {
          formatter = "standard",
          linters = { "standard" },
          addonSettings = {
            ["Ruby LSP Rails"] = {
              enablePendingMigrationsPrompt = false,
            },
          },
        },
      },
    })
    vim.lsp.enable("sorbet")
    vim.lsp.config("sorbet", {
      cmd = { "bin/srb", "tc", "--lsp" },
    })
  elseif ft == "yaml" or ft == "yml" then
    vim.lsp.enable("yamlls")
  end
end

-- Auto-setup LSP when entering a buffer
vim.api.nvim_create_autocmd({"BufEnter", "BufNewFile"}, {
  callback = function()
    local ft = vim.bo.filetype
    if ft and ft ~= "" then
      setup_lsp_for_filetype(ft)
    end
  end,
})

-- Also setup for current buffer
local current_ft = vim.bo.filetype
if current_ft and current_ft ~= "" then
  setup_lsp_for_filetype(current_ft)
end

----           rust_analyzer = {
----             enable = true;
----             installRustc = true;
----             installCargo = true;
----           };

-- clangd.enable = true; # C/C++
----           gopls = {
----             # Golang
----             enable = true;
----             autostart = true;
----           };
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
----       lsp = {
----         luaConfig.post = ''
----           local capabilities = require('blink.cmp').get_lsp_capabilities()
----           local lspconfig = require('lspconfig')
----            lspconfig['ruby_lsp'].setup({ capabilities = capabilities })
----         '';
----
----       };
