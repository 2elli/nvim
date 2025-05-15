return {
    {
        "lewis6991/gitsigns.nvim",
        lazy = false,
        opts = {},
        keys = {
            { "<leader>gg", "<CMD>Gitsigns<CR>",                      desc = "Gitsigns: menu" },
            { "<leader>gb", "<CMD>Gitsigns blame_line<CR>",           desc = "Gitsigns: blame line" },
            { "<leader>gB", "<CMD>Gitsigns blame<CR>",                desc = "Gitsigns: blame menu" },
            { "<leader>gd", "<CMD>vert rightb Gitsigns diffthis<CR>", desc = "Gitsigns: open git diff" },
            { "<leader>gn", "<CMD>Gitsigns next_hunk<CR>",            desc = "Gitsigns: goto next hunk" },
            { "<leader>gp", "<CMD>Gitsigns prev_hunk<CR>",            desc = "Gitsigns: goto prev hunk" },
            { "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>",           desc = "Gitsigns: reset hunk" },
        },
    },
}
