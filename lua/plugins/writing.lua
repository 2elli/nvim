return {
    -- better general text writing
    {
        "preservim/vim-pencil",
        cmd = {
            "Pencil",
            "PencilToggle",
        },
        init = function()
            vim.g["pencil#wrapModeDefault"] = "soft"
            vim.g["pencil#mode_indicators"] = { hard = "󰏫 H", auto = "󰏫 A", soft = "󰏫 S", off = "" }
        end,
    },
    -- live typst preview
    {
        "chomosuke/typst-preview.nvim",
        ft = "typst",
        version = "1.*",
        opts = {},
    },
}
