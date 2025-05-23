return {
    -- marks
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        opts = {
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        },
        config = function(_, opts)
            require("harpoon"):setup(opts)
        end,
        keys = {
            { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon: add file to list" },
            { "<leader>f", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon: toggle quick menu" },
            { "<C-n>", function() require("harpoon"):list():next() end, desc = "Harpoon: goto next mark" },
            { "<C-p>", function() require("harpoon"):list():prev() end, desc = "Harpoon: goto previous mark" },
        },
    },
    -- file tree
    {
        "stevearc/oil.nvim",
        lazy = false,
        opts = {
            skip_confirm_for_simple_edits = true,
            view_options = { show_hidden = true },
            keymaps = {
               ["<ESC>"] = { "actions.close", mode = "n" },
            },
        },
        keys = { { "<leader>e", function() require("oil").toggle_float() end, desc = "Oil: toggle browser" } },
    },
}
