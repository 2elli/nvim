vim.pack.add({
    { src = "https://github.com/folke/snacks.nvim" },
})

-- snacks
require("snacks").setup({
    indent = { enabled = true },
    notifier = { enabled = true },
    picker = { enabled = true },
})

-- picker
vim.keymap.set("n", "<leader>P", function() Snacks.picker() end, { desc = "picker" })
vim.keymap.set("n", "<leader>F", function() Snacks.picker.files() end, { desc = "picker: files" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "picker: grep" })
vim.keymap.set("n", "<leader>pk", function() Snacks.picker.keymaps() end, { desc = "picker: keymaps" })
vim.keymap.set("n", "<leader>xx", function() Snacks.picker.diagnostics_buffer() end, { desc = "picker: diagnostics" })
