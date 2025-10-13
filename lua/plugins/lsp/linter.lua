return {
    {
        "mfussenegger/nvim-lint",
        opts = {
            global_linters = require("lsp").global_linters,
            linters_by_ft = require("lsp").linters_by_ft,
            -- linters_by_ft = {
            --     sh = { "shellcheck" },
            --     bash = { "shellcheck" },
            -- },
        },
        event = { "BufWritePost", "BufEnter" },
        config = function(_, opts)
            -- set linters for all ft
            require("lint").linters_by_ft = opts.linters_by_ft

            -- autocmd try run linters
            vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
                callback = function()
                    local lint = require("lint")

                    -- lint with linters for filetype
                    lint.try_lint()

                    -- try lint with global linters
                    if opts.global_linters ~= nil then
                        lint.try_lint(opts.global_linters)
                    end
                end,
            })

            -- usercmd get available linters
            vim.api.nvim_create_user_command("Linters", function()
                local linters = require("lint").get_running(vim.fn.bufnr())
                vim.print(table.concat(linters, ", "))
            end, {})
        end,
    },
}
