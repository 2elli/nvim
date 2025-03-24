-- options
-- auto loaded in config/lazy.lua

-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tab and indent opts
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- indents
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.smartindent = true

-- no line wrapping
vim.opt.wrap = false

-- minimum num lines to keep around cursor
vim.opt.scrolloff = 8

-- search
vim.opt.ignorecase = true

-- save + undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"

-- term defaults
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- configure new splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- session options
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

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
