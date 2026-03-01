-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("opts")
require("cmds")
require("keymaps")
require("plugins")
require("lsp")
vim.opt.runtimepath:append("/usr/share/vim/vimfiles")
