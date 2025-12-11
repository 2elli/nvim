vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/EdenEast/nightfox.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
})

-- color
require("nightfox").setup({ options = { transparent = true } })
vim.cmd.colorscheme("nightfox")

-- treesitter
require("nvim-treesitter.configs").setup({
    auto_install = true,
})

require("plugins.snacks")
require("plugins.files")
require("plugins.lsp")
require("plugins.git")
