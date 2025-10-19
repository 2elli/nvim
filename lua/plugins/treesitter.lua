return {
    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {

            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
    -- normal or block comment using motions
    { "numToStr/Comment.nvim", opts = {}, event = "VeryLazy" },
    -- better treesitter aware comments
    { "folke/ts-comments.nvim", opts = {}, event = "VeryLazy" },
    -- create annotations with treesitter
    {
        "danymat/neogen",
        opts = {
            languages = {
                python = { template = { annotation_convention = "reST" } },
                lua = { template = { annotation_convention = "emmylua" } },
            },
        },
        cmd = "Neogen",
        keys = {
            {
                "<leader>ng",
                function() require("neogen").generate() end,
                desc = "Neogen: generate annotations",
            },
            {
                "<leader>ns",
                function()
                    vim.ui.select({ "class", "type", "file", "func" }, {
                        prompt = "Neogen: Select type of annotation",
                    }, function(choice)
                        require("neogen").generate({ type = choice })
                    end)
                end,
                desc = "Neogen: select annotation to create",
            },
        },
    },
}
