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
            { "<leader>sl", "<CMD>Telescope persisted<CR>", desc = "Persisted: list sessions" },
            { "<leader>sc", "<CMD>SessionLoad<CR>", desc = "Persisted: load session from current dir" },
            { "<leader>sp", "<CMD>SessionLoadLast<CR>", desc = "Persisted: load previous session" },
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
            {
                "<leader>ns",
                function()
                    vim.ui.select({ "class", "type", "file", "func" }, {
                        prompt = "Neogen: Select type of annotation",
                    }, function(choice)
                        require("neogen").generate({ type = choice })
                    end)
                end,
                desc = "Neogen: select annotation to create",
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
    -- git
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
            { "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", desc = "Gitsigns: reset hunk" },
        },
    },
}
