-- plugins to be loaded by lazy before anything else
return {
    -- util library
    { "nvim-lua/plenary.nvim", priority = 1000 },
    -- icons
    { "nvim-tree/nvim-web-devicons", opts = {}, priority = 999 },
    -- user utils
    {
        "folke/snacks.nvim",
        priority = 998,
        lazy = false,
        opts = {
            -- indent lines
            indent = { animate = { enabled = false } },
            -- disable some features for big files 1.5MB i think
            bigfile = { enabled = true },
            -- undo tree
            picker = { enabled = true },
            -- input ui
            input = { enabled = true },
        },
        config = function(_, opts)
            -- setup
            require("snacks").setup(opts)

            -- make debug helpers
            _G.dd = function(...) Snacks.debug.inspect(...) end
            _G.bt = function() Snacks.debug.backtrace() end

            -- lsp file rename for oil
            vim.api.nvim_create_autocmd("User", {
                pattern = "OilActionsPost",
                callback = function(event)
                    if event.data.actions.type == "move" then
                        Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
                    end
                end,
            })
        end,
        keys = {
            { "<leader>u", function() Snacks.picker.undo() end, desc = "Undo Tree" },
        },
    },
}
