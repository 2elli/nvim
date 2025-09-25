return {
    {
        "saghen/blink.cmp",
        dependencies = "rafamadriz/friendly-snippets",
        version = "*",
        opts = {
            sources = {
                default = { "lazydev", "snippets", "lsp", "path", "buffer" },
                providers = { lazydev = { name = "LazyDev", module = "lazydev.integrations.blink", score_offset = 100 } },
            },
            signature = { enabled = true }, -- show signature help
            completion = {
                -- show lsp docs of option
                documentation = { auto_show = true, auto_show_delay_ms = 50 },
                -- list selection behavior
                list = { selection = { preselect = false, auto_insert = false } },
                -- menu appearance
                menu = { draw = { columns = { { "label", "label_description", gap = 1 }, { "kind" }, { "kind_icon" } } } },
            },
            keymap = {
                -- use default keys as base
                preset = "default",
                -- add "super-tab" like actions
                ["<CR>"] = { "accept", "fallback" },
                ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
                ["<S-Tab>"] = { "select_prev", "snippet_forward", "fallback" },
                -- remap doc scroll so binds work with tmux
                ["<C-u>"] = { "scroll_documentation_up", "fallback" },
                ["<C-d>"] = { "scroll_documentation_down", "fallback" },
            },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {},
    },
    {
        "chrisgrieser/nvim-scissors",
        opts = {
            snippetDir = vim.fn.expand(vim.fn.stdpath("config") .. "/snippets/"),
            editSnippetPopup = { keymaps = { deleteSnippet = "<M-BS>" } },
            jsonFormatter = "jq",
        },
        keys = {
            { "<leader>se", function() require("scissors").editSnippet() end, desc = "Scissors: edit snippet" },
            { "<leader>sa", function() require("scissors").addNewSnippet() end, mode = { "n", "v" }, desc = "Scissors: add new snippet" },
        },
    },
}
