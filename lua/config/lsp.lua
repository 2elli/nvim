local lsp_servers = {
    -- lua
    "lua_ls",
    -- python
    "basedpyright",
    "ruff",
    -- c, c++
    "clangd",
    -- typst
    "tinymist",
    -- bash
    "bashls",
    -- js, ts
    "ts_ls",
    -- rust
    "rust_analyzer",
    -- java
    "jdtls",
    -- go
    "gopls",
    -- zig
    "zls",

    -- json
    "jsonls",
    -- yaml
    "yamlls",
    -- toml
    "taplo",
}

vim.lsp.enable(lsp_servers)
