local M = {}

-- auto commands --
M.setup_autocmds = function()
    -- setup lsp keymaps
    vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions and keymaps",
        callback = function(event)
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            local bufnr = event.buf

            -- map lsp keybinds
            require("keymaps").lsp_binds({ buffer = bufnr })

            -- add navic status
            if client ~= nil and client.server_capabilities.documentSymbolProvider then
                require("nvim-navic").attach(client, bufnr)
                vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
            end
        end,
    })

    -- auto linting
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
        callback = function()
            local lint = require("lint")
            -- lint with linters for filetype
            lint.try_lint()

            -- try lint with global linters
            for _, linter in ipairs(_G.global_linters or {}) do
                lint.try_lint(linter)
            end
        end,
    })
end

-- user commands --
M.setup_usercmds = function()
    -- get any linters available for ft
    vim.api.nvim_create_user_command("Linters", function()
        local linters = {}
        linters.file = require("lint").linters_by_ft[vim.bo.filetype] or nil
        linters.global = _G.global_linters or nil

        local fmt_file = "File: " .. (linters.file and table.concat(linters.file, " ") or "No linters")
        local fmt_global = "Global: " .. (linters.global and table.concat(linters.global, " ") or "No linters")
        vim.print(fmt_file .. ", " .. fmt_global)
    end, {})

    -- get python venv
    vim.api.nvim_create_user_command(
        "Venv",
        function()
            vim.print(require("venv-selector").venv())
        end,
        { desc = "Get Current Python Venv" }
    )
end

-- generic cmds setup
M.setup_cmds = function()
    M.setup_autocmds()
    M.setup_usercmds()
end

return M
