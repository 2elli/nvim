return {
    {
        "stevearc/conform.nvim",
        opts = {
            default_format_opts = { lsp_format = "fallback" },
            formatters_by_ft = {
                python = { "ruff_format", "ruff_organize_imports" },
                c = { "clangformat" },
                cpp = { "clangformat" },
                sh = { "shfmt" },
                bash = { "shfmt" },
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
                function() require("conform").format({ async = true }) end,
                mode = { "n", "v" },
                desc = "Conform: Format",
            },
        },
    },
    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },
}
