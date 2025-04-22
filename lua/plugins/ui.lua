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
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { "filename" },
                lualine_x = { "lsp_status" },
                lualine_y = { "encoding", "fileformat", "filetype" },
                lualine_z = { "progress", "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
        },
        config = function(_, opts)
            -- custom components
            -- vim-pencil status
            local pencil_status = function()
                if require("lazy.core.config").plugins["vim-pencil"]._.loaded then
                    return vim.api.nvim_call_function("PencilMode", {})
                else
                    return ""
                end
            end

            -- add custom components to lualine_x
            opts.sections.lualine_x = {
                pencil_status,
                unpack(opts.sections.lualine_x),
            }

            require("lualine").setup(opts)
        end,
    },
}
