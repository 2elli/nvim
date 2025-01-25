-- enable exrc
vim.opt.exrc = true
-- disable python3 provider searching
vim.g.loaded_python3_provider = 0

require("default")
require("plugins")
