-- auto install mason tools, lsp's are installed with mason-lspconfig
return {
    {
        "WhoIsSethDaniel/mason-tool-installer",

        opts = {
            ensure_installed = {
                -- formatter
                "ruff",         -- python
                "clang-format", -- c, cpp
                "shfmt",        -- sh, bash
                -- linting
                "typos",        -- all
                "shellcheck",   -- sh, bash
            },
            run_on_start = false,
            integrations = { ["mason-lspconfig"] = false, ["mason-null-ls"] = false, ["mason-nvim-dap"] = false },
        },
        cmd = {
            "MasonToolsInstall",
            "MasonToolsUpdate",
            "MasonToolsClean",
        },
    },
}
