-- options
-- auto loaded in config/lazy.lua

-- line numbers
vim.o.nu = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"

-- tab and indent opts
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- indents
vim.o.autoindent = true
vim.o.copyindent = true
vim.o.smartindent = true

-- no line wrapping
vim.o.wrap = false

-- minimum num lines to keep around cursor
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

-- search
vim.o.ignorecase = true
vim.o.smartcase = true

-- save + undo
vim.o.swapfile = false
vim.o.backup = false
vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath("data") .. "/undodir"

-- term defaults
vim.o.termguicolors = true
vim.o.background = "dark"

-- configure new splits
vim.o.splitright = true
vim.o.splitbelow = true

-- session options
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- window border
vim.o.winborder = "rounded"

-- icons
vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN] = "▲",
            [vim.diagnostic.severity.HINT] = "⚑",
            [vim.diagnostic.severity.INFO] = "",
        },
    },
})
