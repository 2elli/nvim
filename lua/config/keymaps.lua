-- keymaps
-- auto loaded in config/lazy.lua

-- no op leader key
vim.keymap.set("n", "<SPACE>", "<Nop>", { desc = "nop leader key" })

-- keep page dwn + up centered
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "center page up" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "center page down" })

-- keep searching dwn + up centered
vim.keymap.set("n", "n", "nzzzv", { desc = "center searching" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "center searching" })

-- clear search highlight
vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>", { desc = "clear search highlights" })

-- move lines
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "move visual selection up" })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "move visual selection down" })
vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "move selection up" })
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "move selection down" })

-- append lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "append next line to current" })
vim.keymap.set("n", "<C-J>", "mzj:m .-2<CR>==J`z", { desc = "append current line to next" })

-- delete without copying to register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "delete without copying to register" })
