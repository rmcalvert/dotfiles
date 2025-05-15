vim.lsp.enable("lua_ls")
vim.lsp.enable("nil_ls") -- nix
vim.lsp.enable("nixd")
vim.lsp.enable("ts_ls")
vim.lsp.enable("cssls")
vim.lsp.enable("html")
-- vim.lsp.enable("htmx")
-- vim.lsp.enable("tailwind")
-- vim.lsp.enable("pyright") -- Python
vim.lsp.enable("marksman") -- Markdown
vim.lsp.enable("dockerls") -- Docker
vim.lsp.enable("bashls") -- Bash
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
----           solargraph = {
----             enable = false;
----             cmd = [
----               "./bin/solargraph"
----               "stdio"
----             ];
----           };
vim.lsp.enable("sorbet")
vim.lsp.config("sorbet", {
	cmd = { "bin/srb", "tc", "--lsp" },
})
vim.lsp.enable("yamlls") -- yaml

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
