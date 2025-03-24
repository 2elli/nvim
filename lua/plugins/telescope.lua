return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-telescope/telescope-fzf-native.nvim", build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release" },
        },
        opts = {},
        config = function()
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("persisted")
        end,
        cmd = "Telescope",
        keys = {
            { "<leader>/", function() require("telescope.builtin").live_grep() end, desc = "Telescope: live_grep" },
            { "<leader>F", function() require("telescope.builtin").find_files() end, desc = "Telescope: find_files" },
            { "<leader>tt", function() require("telescope.builtin").builtin() end, desc = "Telescope: builtins" },
            { "<leader>tk", function() require("telescope.builtin").keymaps() end, desc = "Telescope: keymaps" },
            { "<leader>tc", function() require("telescope.builtin").commands() end, desc = "Telescope: commands" },
            { "<leader>tq", function() require("telescope.builtin").quickfix() end, desc = "Telescope: quickfix" },
            { "<leader>tj", function() require("telescope.builtin").jumplist() end, desc = "Telescope: jumplist" },
            { "<leader>tb", function() require("telescope.builtin").buffers() end, desc = "Telescope: buffers" },
            { "<leader>t\"", function() require("telescope.builtin").registers() end, desc = "Telescope: registers" },
        },
    },
}
