-- options
local o = vim.o

-- line numbers
o.nu = true
o.relativenumber = true

o.signcolumn = "yes"

-- tab and indent opts
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

-- indents
o.autoindent = true
o.copyindent = true
o.smartindent = true

-- no line wrapping
o.wrap = false

-- minimum num lines to keep around cursor
o.scrolloff = 8
o.sidescrolloff = 8

-- search
o.ignorecase = true
o.smartcase = true

-- save + undo
o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = vim.fn.stdpath("data") .. "/undodir"

-- term defaults
o.termguicolors = true
o.background = "dark"

-- configure new splits
o.splitright = true
o.splitbelow = true

-- session options
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- window border
o.winborder = "rounded"

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
