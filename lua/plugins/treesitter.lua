return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = { "c", "cpp", "python", "lua", "bash", "json" },
            auto_install = true,
            highlight = { enable = true },
        },
    },
}
