-- only run these on user command InstallMasonDeps, which requires each deps to be loaded.
-- this is so conform and lint can still be lazy loaded
return {
    {
        "zapling/mason-conform.nvim",
        dependencies = { "stevearc/conform.nvim" },
        opts = {},
        cmd = "InstallMasonDeps",
    },
    {
        "rshkarin/mason-nvim-lint",
        dependencies = { "mfussenegger/nvim-lint" },
        opts = { ensure_installed = { "typos" } },
        cmd = "InstallMasonDeps",
    },
}
