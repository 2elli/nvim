local map = vim.keymap.set
map("n", "<leader>cc", "<cmd>RocqStart<cr>", { desc = "Rocq: Launch coqtail in current buf" })
map("n", "<leader>cq", "<cmd>RocqStop<cr>", { desc = "Rocq: Stop coqtail in current buf" })
map("n", "<leader>cj", "<cmd>RocqNext<cr>", { desc = "Rocq: Send next sentence" })
map("n", "<leader>ck", "<cmd>RocqUndo<cr>", { desc = "Rocq: Step back 1 sentence" })
map("n", "<leader>cl", "<cmd>RocqToLine<cr>", { desc = "Rocq: Send all sentences up to line" })
map("n", "<leader>cL", "<cmd>RocqToLine<cr>", { desc = "Rocq: Send all sentences" })
