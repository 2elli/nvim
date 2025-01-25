return {
    { "RRethy/vim-illuminate" },
    { "stevearc/dressing.nvim", opts = {} },
    { "j-hui/fidget.nvim", opts = {} },
    { "sphamba/smear-cursor.nvim", opts = { stiffness = 0.8, trailing_stiffness = 0.5, distance_stop_animating = 0.5, hide_target_hack = false } },
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
