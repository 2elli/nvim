-- auto install mason tools, lsp's are installed with mason-lspconfig
return {
    {
        "WhoIsSethDaniel/mason-tool-installer",

        opts = {
            ensure_installed = {
                -- all
                "typos",        -- lint
                -- c, cpp
                "clang-format", -- format
                -- sh, bash
                "shfmt",        -- format
                "shellcheck",   -- lint
            },
            run_on_start = false,
            integrations = { ["mason-lspconfig"] = false, ["mason-null-ls"] = false, ["mason-nvim-dap"] = false },
        },
        cmd = {
            "MasonToolsInstall",
            "MasonToolsInstallSync",
            "MasonToolsUpdate",
            "MasonToolsUpdateSync",
            "MasonToolsClean",
        },
    },
}
