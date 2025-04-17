local required_mason_tools = {
    -- spellcheck
    "typos",
    -- python
    "basedpyright",
    "ruff",
    -- lua
    "lua-language-server", --(lua_ls)
    -- c c++
    "clangd",
    "clang-format",
    -- sh
    "bash-language-server", --(bashls)
    "shellcheck",
    "shfmt",
    -- java
    "jdtls",
    -- go
    "gopls",
    -- rust
    "rust-analyzer", --(rust_analyzer)
    -- ts
    "typescript-language-server", --(ts_ls)
    -- zig
    "zls",
    -- typst
    "tinymist",
    -- json
    "json-lsp", --(jsonls)
    -- toml
    "taplo",
    -- yaml
    "yaml-language-server",
}

return {
    { "williamboman/mason.nvim", opts = {} },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        opts = {
            ensure_installed = required_mason_tools,
            integrations = { ["*"] = false },
        },
    },
}
