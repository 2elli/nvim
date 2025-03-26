return {
    -- highlight text under cursor and navigate references
    { "RRethy/vim-illuminate" },
    -- lsp progress notifs
    { "j-hui/fidget.nvim", opts = {} },
    -- better ui components
    { "stevearc/dressing.nvim", opts = {} },
    -- animate cursor
    { "sphamba/smear-cursor.nvim", opts = { stiffness = 0.8, trailing_stiffness = 0.5, distance_stop_animating = 0.5, hide_target_hack = false } },
    -- show marks in gutter, also menu for marks
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            { "<leader>m", "<CMD>MarksListAll<CR>", desc = "List marks" },
        },
    },
    -- better status line
    {
        "nvim-lualine/lualine.nvim",
        opts = {
            options = {
                component_separators = { left = "|", right = "|" },
                section_separators = { left = "", right = "" },
            },
        },
    },
}
