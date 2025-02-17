return {
    -- lsp
    { "SmiteshP/nvim-navic" },
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", opts = {} },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                -- lua
                "lua_ls",
                -- python
                "basedpyright",
                "ruff",
                -- sh
                "bashls",
                -- c / c++
                "clangd",
                -- java
                "jdtls",
                -- rust
                "rust_analyzer",
                -- ts and js
                "ts_ls",
                -- zig
                "zls",
                -- go
                "gopls",
                -- typst
                "tinymist",
                -- json
                "jsonls",
                -- toml
                "taplo"
            },
            -- handlers for different lsp's
            handlers = {
                -- generic handler
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = require("blink.cmp").get_lsp_capabilities(),
                    })
                end,

                -- custom handlers
                -- python
                ruff = function()
                    require("lspconfig").ruff.setup({
                        capabilities = require("blink.cmp").get_lsp_capabilities(),
                        init_options = {
                            settings = {
                                configurationPreference = "filesystemFirst",
                                lineLength = 240,
                            }
                        },
                        on_attach = function(client)
                            client.server_capabilities.hoverProvider = false
                        end,
                    })
                end,
                basedpyright = function()
                    require("lspconfig").basedpyright.setup({
                        capabilities = require("blink.cmp").get_lsp_capabilities(),
                        settings = {
                            basedpyright = {
                                analysis = {
                                    typeCheckingMode = "standard",
                                    useLibraryCodeForTypes = true,
                                    autoSearchPaths = true,
                                    autoImportCompletions = true,
                                },
                                disableOrganizeImports = true,
                                disableTaggedHints = false,
                            },
                        },
                    })
                end,

                -- lua
                lua_ls = function()
                    require("lspconfig").lua_ls.setup({
                        -- ignore global "vim" and dont align tables
                        capabilities = require("blink.cmp").get_lsp_capabilities(),
                        settings = {
                            Lua = {
                                format = {
                                    enable = true,
                                    defaultConfig = {
                                        align_array_table = "false",
                                        trailing_table_separator = "smart",
                                    },
                                },
                            },
                        },
                    })
                end,

                -- c, cpp
                clangd = function()
                    require("lspconfig").clangd.setup({
                        capabilities = require("blink.cmp").get_lsp_capabilities(),
                        -- dont format with clangd
                        on_attach = function(client)
                            client.server_capabilities.documentFormattingProvider = false
                            client.server_capabilities.documentFormattingRangeProvider = false
                        end,
                        cmd = { "clangd", "--offset-encoding=utf-16" },
                    })
                end,
            },
        },
        config = function(_, opts)
            -- setup lsp
            require("mason-lspconfig").setup(opts)

            -- setup lsp keybinds and navic status
            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions and keymaps",
                callback = function(event)
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    local bufnr = event.buf

                    -- wrappers to make keymaps
                    local opt = function(desc) return { desc = desc, buffer = bufnr } end
                    local set = vim.keymap.set

                    -- set keymaps
                    set("n", "K", function() vim.lsp.buf.hover() end, opt("LSP: hover"))
                    set("n", "gd", function() vim.lsp.buf.definition() end, opt("LSP: jump to symbol definition"))
                    set("n", "gD", function() vim.lsp.buf.declaration() end, opt("LSP: jump to symbol declaration"))
                    set("n", "gy", function() vim.lsp.buf.type_definition() end, opt("LSP: jump to type definition"))
                    set("n", "gi", function() vim.lsp.buf.implementation() end, opt("LSP: list symbol implementations"))
                    set("n", "gr", function() vim.lsp.buf.references() end, opt("LSP: list symbol references"))
                    set("n", "<leader>lh", function() vim.lsp.buf.signature_help() end, opt("LSP: symbol signature info"))
                    set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opt("LSP: select a code action"))
                    set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opt("LSP: rename symbol"))

                    -- add navic status
                    if client ~= nil and client.server_capabilities.documentSymbolProvider then
                        require("nvim-navic").attach(client, bufnr)
                        vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
                    end
                end,
            })
        end,
    },
}
