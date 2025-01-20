local M = {}

M.setup = function(on_attach, capabilities)
    local lspconfig = require("lspconfig")
    lspconfig.solargraph.setup({
        -- cmd = { "bundle", "exec", "solargraph", "stdio" },
        cmd = { "solargraph", "stdio" },
        filetypes = { "ruby" },
        init_options = {
            formatting = false,
        },
        -- root_dir = require("lspconfig.util").root_pattern("Gemfile", ".git", "."),
        --flags = {
        --    debounce_text_changes = 150
        --},
        settings = {
            solargraph = {
                diagnostics = false,
                completion = true,
                references = true,
                -- useBundler = true
                -- autoformat = true,
                -- logLevel = "debug",
                -- folding = false,
                -- rename = true,
                -- symbols = true,
            },
        },
        capabilities = capabilities,
        on_attach = on_attach,
    })
end
return M
