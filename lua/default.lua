-- default.lua , neovim config file 2elli
-- line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- tabs and width
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

-- set scrolloff size
vim.opt.scrolloff = 8

-- search
vim.opt.ignorecase = true

-- save undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"

-- term defaults
vim.opt.termguicolors = true
vim.g.have_nerd_font = true

-- configure new splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- session options
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- use default keybinds
require("keymaps").builtin_binds()
