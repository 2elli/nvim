-- exrc
vim.opt.exrc = true
-- dont search for python
vim.g.loaded_python3_provider = 0

-- leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")
