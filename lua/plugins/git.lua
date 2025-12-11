vim.pack.add({
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("gitsigns").setup()
-- keymap
vim.keymap.set("n", "<leader>gg", "<CMD>Gitsigns<CR>", { desc = "Gitsigns: menu" })
vim.keymap.set("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>", { desc = "Gitsigns: blame line" })
vim.keymap.set("n", "<leader>gB", "<CMD>Gitsigns blame<CR>", { desc = "Gitsigns: blame menu" })
vim.keymap.set("n", "<leader>gd", "<CMD>vert rightb Gitsigns diffthis<CR>", { desc = "Gitsigns: open git diff" })
vim.keymap.set("n", "<leader>gn", "<CMD>Gitsigns next_hunk<CR>", { desc = "Gitsigns: goto next hunk" })
vim.keymap.set("n", "<leader>gp", "<CMD>Gitsigns prev_hunk<CR>", { desc = "Gitsigns: goto prev hunk" })
vim.keymap.set("n", "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", { desc = "Gitsigns: reset hunk" })
