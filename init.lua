-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("opts")
require("cmds")
require("keymaps")
require("plugins")
require("lsp")

local vf = "/usr/share/vim/vimfiles"
if vim.fn.isdirectory(vf) then vim.opt.runtimepath:append(vf) end
