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
    -- live latex preview
    {
        "frabjous/knap",
        ft = "tex",
        config = function()
            vim.g.knap_settings = {
                texoutputext = "pdf",
                textopdf = "tectonic --synctex %docroot%",
            }

            -- create knap tex commands
            local knap = require("knap")
            local knap_commands = {
                Preview = knap.toggle_autopreviewing,
                CloseViewer = knap.close_viewer,
                Process = knap.process_once,
            }
            for name, func in pairs(knap_commands) do
                vim.api.nvim_create_user_command(
                    "Tex" .. name,
                    function()
                        return func()
                    end,
                    {}
                )
            end
        end,
    },
}
