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
    { src = "https://github.com/mfussenegger/nvim-lint" },
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("^1"),
    },
    -- fzf
    { src = "https://github.com/ibhagwan/fzf-lua" },
    -- writing
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    -- rocq
    { src = "https://github.com/whonore/Coqtail" },
})

local map = vim.keymap.set

-- colorscheme
require("nightfox").setup({ options = { transparent = true } })
vim.cmd.colorscheme("nightfox")

-- treesitter
require("nvim-treesitter.configs").setup({
    auto_install = true,
})

-- quick files
require("harpoon"):setup()
map("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Harpoon: add file to list" })
map("n", "<leader>f", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end,
    { desc = "Harpoon: toggle quick menu" })
map("n", "<C-n>", function() require("harpoon"):list():next() end, { desc = "Harpoon: goto next mark" })
map("n", "<C-p>", function() require("harpoon"):list():prev() end, { desc = "Harpoon: goto previous mark" })

-- explorer
require("oil").setup()
map("n", "<leader>e", function() require("oil").toggle_float() end, { desc = "Oil: toggle float" })

-- git
require("gitsigns").setup()
map("n", "<leader>gg", "<CMD>Gitsigns<CR>", { desc = "Gitsigns: menu" })
map("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>", { desc = "Gitsigns: blame line" })
map("n", "<leader>gB", "<CMD>Gitsigns blame<CR>", { desc = "Gitsigns: blame menu" })
map("n", "<leader>gd", "<CMD>vert rightb Gitsigns diffthis<CR>", { desc = "Gitsigns: open git diff" })
map("n", "<leader>gn", "<CMD>Gitsigns next_hunk<CR>", { desc = "Gitsigns: goto next hunk" })
map("n", "<leader>gp", "<CMD>Gitsigns prev_hunk<CR>", { desc = "Gitsigns: goto prev hunk" })
map("n", "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "Gitsigns: reset hunk" })

-- fzf
map("n", "<leader>/", function() require("fzf-lua").live_grep_native() end, { desc = "fzf grep" })
map("n", "<leader>F", function() require("fzf-lua").files() end, { desc = "fzf grep" })
map("n", "<leader>k", function() require("fzf-lua").keymaps() end, { desc = "fzf grep" })

-- lsp servers
require("mason").setup()

-- formatting
require("conform").setup({
    default_format_opts = { lsp_format = "fallback", async = true },
    formatters_by_ft = {
        rust = { "rustfmt" },
    },
})
map({ "n", "x" }, "<leader>lf", function() require("conform").format() end, { desc = "conform format" })

-- linters
local global_linters = { "typos" }
require("lint").linters_by_ft = {
    c = { "clangtidy" },
    cpp = { "clangtidy" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        require("lint").try_lint()
        for _, linter in ipairs(global_linters) do
            require("lint").try_lint(linter)
        end
    end,
})

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

-- rocq
-- dont use default maps
vim.g.coqtail_nomap = 1
map("n", "<leader>cc", "<cmd>RocqStart<cr>", { desc = "Rocq: Launch coqtail in current buf" })
map("n", "<leader>cq", "<cmd>RocqStop<cr>", { desc = "Rocq: Stop coqtail in current buf" })
map("n", "<leader>cj", "<cmd>RocqNext<cr>", { desc = "Rocq: Send next sentence" })
map("n", "<leader>ck", "<cmd>RocqUndo<cr>", { desc = "Rocq: Step back 1 sentence" })
map("n", "<leader>cl", "<cmd>RocqToLine<cr>", { desc = "Rocq: Send all sentences up to line" })
map("n", "<leader>cL", "<cmd>RocqToLine<cr>", { desc = "Rocq: Send all sentences" })
