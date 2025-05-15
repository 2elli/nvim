return {
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            { "<leader>xx", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Trouble: diagnostics for local buffer" },
            { "<leader>xX", "<CMD>Trouble diagnostics toggle<CR>", desc = "Trouble: diagnostics for working dir" },
        },
    },
}
