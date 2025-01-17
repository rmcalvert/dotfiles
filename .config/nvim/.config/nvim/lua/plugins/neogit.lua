local present, neogit = pcall(require, "neogit")
if not present then
    return
end

--    if not packer_plugins["plenary.nvim"].loaded then
--        vim.cmd [[packadd plenary.nvim]]
--    end
--    if not packer_plugins["diffview.nvim"].loaded then
--        vim.cmd [[packadd diffview.nvim]]
--    end
neogit.setup({
    disable_signs = false,
    disable_context_highlighting = false,
    disable_commit_confirmation = false,
    signs = {
        section = { "", "" },
        item = { "", "" },
        hunk = { "", "" },
    },
    integrations = { diffview = true },
})
