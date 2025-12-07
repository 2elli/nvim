vim.pack.add({
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/folke/snacks.nvim" },
    { src = "https://github.com/stevearc/oil.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version="master" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
})

-- color
require("nightfox").setup({options={transparent=true}})
vim.cmd.colorscheme("nightfox")

require("snacks").setup({
    indent = {enabled = true},
    notifier = {enabled = true},
    picker = {enabled = true},
})

-- picker
vim.keymap.set("n", "<leader>P", function() Snacks.picker() end, {desc = "picker"})
vim.keymap.set("n", "<leader>f", function() Snacks.picker.files() end, {desc = "picker: files"})
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, {desc = "picker: grep"})
vim.keymap.set("n", "<leader>pk", function() Snacks.picker.keymaps() end, {desc = "picker: keymaps"})
vim.keymap.set("n", "<leader>xx", function() Snacks.picker.diagnostics_buffer() end, {desc = "picker: diagnostics"})

-- git
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, {desc = "git diff"})
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end, {desc = "git log"})
vim.keymap.set("n", "<leader>gb", function() Snacks.git.blame_line() end, {desc = "git blame"})

-- files
local oil = require("oil")
oil.setup()
vim.keymap.set("n", "<leader>e", function() oil.toggle_float() end, {desc = "open oil"})

require("nvim-treesitter.configs").setup({
    auto_install=true,
})

-- lsp
require("mason").setup()
-- formatter
require("conform").setup({
    default_format_opts = { lsp_format = "fallback", async = true },
    formatters_by_ft = {
        ocaml = {"ocamlformat"}
    }
})
vim.keymap.set("n", "<leader>lf", function() require("conform").format() end, { desc = "lsp format" })
