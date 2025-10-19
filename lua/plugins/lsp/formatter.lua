return {
    {
        "stevearc/conform.nvim",
        opts = {
            default_format_opts = { lsp_format = "fallback", async = true },
            formatters_by_ft = require("lsp").formatters_by_ft,
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
