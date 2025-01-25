local M = {}

--- create command InstallMasonDeps to auto install conform and nvim-lint binaries in mason
M.setup_InstallMasonDeps = function()
    vim.api.nvim_create_user_command("InstallMasonDeps", function()
        vim.cmd.Lazy("load mason-conform.nvim")
        vim.cmd.Lazy("load mason-nvim-lint")
    end, {})
end

M.setup = function() end

return M
