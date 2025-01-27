return {
    {
        "mfussenegger/nvim-lint",
        opts = {
            global_linters = { "typos" },
            linters_by_ft = {
                sh = { "shellcheck" },
                bash = { "shellcheck" },
                python = { "ruff" },
            },
        },
        event = { "BufWritePost", "BufEnter" },
        config = function(_, opts)
            -- set linters for all ft
            require("lint").linters_by_ft = opts.linters_by_ft

            -- autocmd show lint diagnostics
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
                callback = function()
                    local lint = require("lint")

                    -- lint with linters for filetype
                    lint.try_lint()

                    -- try lint with global linters
                    lint.try_lint(opts.global_linters or {})
                end,
            })

            -- usercmd get available linters
            vim.api.nvim_create_user_command("Linters", function()
                local linters = {}
                linters.file = require("lint").linters_by_ft[vim.bo.filetype] or nil
                linters.global = opts.global_linters or nil

                local fmt_file = "File: " .. (linters.file and table.concat(linters.file, " ") or "No linters")
                local fmt_global = "Global: " .. (linters.global and table.concat(linters.global, " ") or "No linters")
                vim.print(fmt_file .. ", " .. fmt_global)
            end, {})
        end,
    },
}
