return {
    {
        "stevearc/conform.nvim",
        opts = {
            default_format_opts = { lsp_format = "fallback", async = true },
            formatters_by_ft = {
                c = { "clangformat" },
                cpp = { "clangformat" },
                sh = { "shfmt" },
                bash = { "shfmt" },
                zsh = { "beautysh" },
                tex = { "tex-fmt" },
            },
            formatters = {
                clangformat = {
                    command = "clang-format",
                    args = "--style=\"{UseTab: Always, IndentWidth: 4, TabWidth: 4, ColumnLimit: 200}\"",
                },
            },
        },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>lf",
                function() require("conform").format() end,
                mode = { "n", "v" },
                desc = "Conform: Format",
            },
        },
    },
}
