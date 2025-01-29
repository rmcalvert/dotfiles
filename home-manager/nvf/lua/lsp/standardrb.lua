local M = {}

M.setup = function(on_attach, capabilities)
    local lspconfig = require("lspconfig")
    lspconfig.standardrb.setup({

        capabilities = capabilities,
        on_attach = on_attach,
    })
end
return M
