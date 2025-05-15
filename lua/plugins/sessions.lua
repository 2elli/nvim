return {
    -- save sessions
    {
        "olimorris/persisted.nvim",
        opts = { autostart = false, use_git_branch = true },
        cmd = {
            "SessionSave",
            "Telescope persisted",
            "SessionLoad",
            "SessionLoadLast",
            "SessionDelete",
        },
        keys = {
            { "<leader>sw", "<CMD>SessionSave<CR>",         desc = "Persisted: save current session" },
            { "<leader>sl", "<CMD>Telescope persisted<CR>", desc = "Persisted: list sessions" },
            { "<leader>sc", "<CMD>SessionLoad<CR>",         desc = "Persisted: load session from current dir" },
            { "<leader>sp", "<CMD>SessionLoadLast<CR>",     desc = "Persisted: load previous session" },
        },
    },
}
