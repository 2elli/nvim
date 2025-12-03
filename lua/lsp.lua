local M = {}

--- table of all the names of tools for mason to install
M.mason_tools = {}

--- creates a string for lsp, linter, and formatter configs while updating local M.mason_names
---@param tool string name of lsp server, linter, or formatter name
---@param mason string? optional name of tool's mason package (= mason or tool)
---@return string tool
local tool_entry = function(tool, mason)
    mason = mason or tool
    if not vim.tbl_contains(M.mason_tools, mason) then
        table.insert(M.mason_tools, mason)
    end
    return tool
end

local t = tool_entry

--- list of all lsp servers
M.lsp_servers = {
    -- lua
    t("lua_ls", "lua-language-server"),
    -- python
    -- t("pyrefly"),
    t("basedpyright"),
    t("ruff"),
    -- c, c++
    t("clangd"),
    -- bash
    t("bashls", "bash-language-server"),
    -- js, ts
    t("ts_ls", "typescript-language-server"),
    -- rust
    t("rust_analyzer", "rust-analyzer"),
    -- java
    t("jdtls"),
    -- go
    t("gopls"),
    -- zig
    t("zls"),
    -- ocaml
    t("ocamllsp", "ocaml-lsp"),

    -- typst
    t("tinymist"),
    -- latex
    t("texlab"),

    -- json
    t("jsonls", "json-lsp"),
    -- yaml
    t("yamlls", "yaml-language-server"),
    -- toml
    t("taplo"),
}

--- linters to use across all filetypes
M.global_linters = {
    t("typos"),
}

--- linters for specific filetypes
M.linters_by_ft = {
    sh = { t("shellcheck") },
    bash = { t("shellcheck") },
}

--- formatters for specific filetypes
M.formatters_by_ft = {
    sh = { t("shfmt") },
    bash = { t("shfmt") },
    zsh = { t("beautysh") },
    tex = { t("tex-fmt") },
}

--- vim.lsp.enable lsp servers
M.enable_lsp_servers = function()
    vim.lsp.enable(M.lsp_servers)
end

return M
