vim.pack.add({
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
})
-- quick files
require("harpoon"):setup()
vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end, { desc = "Harpoon: add file to list" })
vim.keymap.set("n", "<leader>f", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, { desc = "Harpoon: toggle quick menu" })
vim.keymap.set("n", "<C-n>", function() require("harpoon"):list():next() end, { desc = "Harpoon: goto next mark" })
vim.keymap.set("n", "<C-p>", function() require("harpoon"):list():prev() end, { desc = "Harpoon: goto previous mark" })

-- explorer
require("oil").setup()
vim.keymap.set("n", "<leader>e", function() require("oil").toggle_float() end, { desc = "open oil" })
