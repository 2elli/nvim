return {
    { "mason-org/mason.nvim", opts = {} },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = require("lsp").mason_tools,
            integrations = { ["*"] = false },
        },
    },
}
