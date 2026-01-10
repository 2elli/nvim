-- plugins
vim.pack.add({
    -- deps
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
    -- files
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
    -- git
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    -- lsp
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("^1"),
    },
    -- fzf
    { src = "https://github.com/ibhagwan/fzf-lua" },
    -- writing
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
})

-- colorscheme
require("nightfox").setup({ options = { transparent = true } })
vim.cmd.colorscheme("nightfox")

-- treesitter
require("nvim-treesitter.configs").setup({
    auto_install = true,
})

-- quick files
require("harpoon"):setup()
vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Harpoon: add file to list" })
vim.keymap.set("n", "<leader>f", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
    { desc = "Harpoon: toggle quick menu" })
vim.keymap.set("n", "<C-n>", function() require("harpoon"):list():next() end, { desc = "Harpoon: goto next mark" })
vim.keymap.set("n", "<C-p>", function() require("harpoon"):list():prev() end, { desc = "Harpoon: goto previous mark" })

-- explorer
require("oil").setup()
vim.keymap.set("n", "<leader>e", function() require("oil").toggle_float() end, { desc = "Oil: toggle float" })

-- git
require("gitsigns").setup()
vim.keymap.set("n", "<leader>gg", "<CMD>Gitsigns<CR>", { desc = "Gitsigns: menu" })
vim.keymap.set("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>", { desc = "Gitsigns: blame line" })
vim.keymap.set("n", "<leader>gB", "<CMD>Gitsigns blame<CR>", { desc = "Gitsigns: blame menu" })
vim.keymap.set("n", "<leader>gd", "<CMD>vert rightb Gitsigns diffthis<CR>", { desc = "Gitsigns: open git diff" })
vim.keymap.set("n", "<leader>gn", "<CMD>Gitsigns next_hunk<CR>", { desc = "Gitsigns: goto next hunk" })
vim.keymap.set("n", "<leader>gp", "<CMD>Gitsigns prev_hunk<CR>", { desc = "Gitsigns: goto prev hunk" })
vim.keymap.set("n", "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "Gitsigns: reset hunk" })

-- fzf
vim.keymap.set("n", "<leader>/", function() require("fzf-lua").live_grep_native() end, { desc = "fzf grep" })
vim.keymap.set("n", "<leader>F", function() require("fzf-lua").files() end, { desc = "fzf grep" })
vim.keymap.set("n", "<leader>k", function() require("fzf-lua").keymaps() end, { desc = "fzf grep" })

-- lsp servers
require("mason").setup()

-- formatting
require("conform").setup({
    default_format_opts = { lsp_format = "fallback", async = true },
    formatters_by_ft = {
        rust = { "rustfmt" },
    },
})
vim.keymap.set({ "n", "x" }, "<leader>lf", function() require("conform").format() end, { desc = "conform format" })

-- autocomplete
require("blink.cmp").setup({
    signature = { enabled = true }, -- show signature help
    completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        list = { selection = { preselect = false, auto_insert = true } },
        menu = { draw = { columns = { { "label", "label_description", gap = 1 }, { "kind" }, { "kind_icon" } } } },
    },
    keymap = {
        -- use default keys as base
        preset = "default",
        -- add "super-tab" like actions
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_forward", "fallback" },
        -- remap doc scroll so binds work with tmux
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },
})

-- writing
vim.api.nvim_create_user_command("TypstPreview",
    function()
        require("typst-preview").setup({})
        vim.cmd.TypstPreview()
    end,
    { desc = "run typst preview" }
)
