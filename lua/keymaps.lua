-- keymaps
local map = vim.keymap.set

-- no op leader key
map("n", "<SPACE>", "<Nop>", { desc = "nop leader key" })

-- keep page dwn + up centered
map("n", "<C-u>", "<C-u>zz", { desc = "center page up" })
map("n", "<C-d>", "<C-d>zz", { desc = "center page down" })

-- keep searching dwn + up centered
map("n", "n", "nzzzv", { desc = "center searching" })
map("n", "N", "Nzzzv", { desc = "center searching" })

-- clear search highlight
map("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "clear search highlights" })

-- move lines (from lazy)
map("n", "<M-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "move line down" })
map("n", "<M-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "move line up" })
map("v", "<M-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "move line down" })
map("v", "<M-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "move line up" })

-- append lines
map("n", "J", "mzJ`z", { desc = "append next line to current" })
map("n", "<M-J>", "mzj:m .-2<CR>==J`z", { desc = "append current line to next" })

-- netrw
map("n", "<leader>e", "<CMD>Ex %:p:h<CR>", { desc = "open netrw" })

-- format
map("n", "<leader>lf", function() vim.lsp.buf.format() end, { desc = "lsp format" })
