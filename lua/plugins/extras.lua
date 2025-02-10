return {
    -- sessions
    {
        "olimorris/persisted.nvim",
        opts = { autostart = false, use_git_branch = true },
        cmd = {
            "SessionSave",
            "Telescope persisted",
            "SessionLoad",
            "SessionLoadLast",
            "SessionDelete",
        },
        keys = {
            { "<leader>sw", "<CMD>SessionSave<CR>", desc = "Persisted: save current session" },
            { "<leader>ss", "<CMD>Telescope persisted<CR>", desc = "Persisted: list sessions" },
            { "<leader>sc", "<CMD>SessionLoad<CR>", desc = "Persisted: load session from current dir" },
            { "<leader>sl", "<CMD>SessionLoadLast<CR>", desc = "Persisted: load last session" },
        },
    },
    -- auto create annotations
    {
        "danymat/neogen",
        opts = {
            languages = {
                python = { template = { annotation_convention = "reST" } },
                lua = { template = { annotation_convention = "emmylua" } },
            },
        },
        cmd = "Neogen",
        keys = {
            {
                "<leader>ng",
                function() require("neogen").generate() end,
                desc = "Neogen: generate annotations",
            },
        },
    },
    -- diagnostics
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble: diagnostics for local buffer" },
            { "<leader>xX", "<CMD>Trouble diagnostics toggle<CR>", desc = "Trouble: diagnostics for working dir" },
        },
    },
    -- undotree
    {
        "mbbill/undotree",
        cmd = "UndotreeToggle",
        keys = { { "<leader>u", "<CMD>UndotreeToggle<CR>", desc = "toggle undotree menu" } },
    },
    -- git actions
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        opts = {},
        keys = {
            { "<leader>gg", "<CMD>Gitsigns<CR>", desc = "Gitsigns: menu" },
            { "<leader>gb", "<CMD>Gitsigns blame_line<CR>", desc = "Gitsigns: blame line" },
            { "<leader>gB", "<CMD>Gitsigns blame<CR>", desc = "Gitsigns: blame menu" },
            { "<leader>gd", "<CMD>vert rightb Gitsigns diffthis<CR>", desc = "Gitsigns: open git diff" },
            { "<leader>gn", "<CMD>Gitsigns next_hunk<CR>", desc = "Gitsigns: goto next hunk" },
            { "<leader>gp", "<CMD>Gitsigns prev_hunk<CR>", desc = "Gitsigns: goto prev hunk" },
        },
    },
    -- better general text writing
    {
        "preservim/vim-pencil",
        cmd = "Pencil"
    },
    -- view keymaps used visually
    {
        "meznaric/key-analyzer.nvim",
        opts = {},
        cmd = { "KeyAnalyzer" },
    },
    -- indent lines and disable some features for big files 1.5MB i think
    {
        "folke/snacks.nvim",
        opts = { indent = { animate = { enabled = false } }, bigfile = {} },
    },
}
