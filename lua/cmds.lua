-- autocmds --
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- cmds --
vim.api.nvim_create_user_command(
    "CleanCache",
    function()
        local dat = vim.fn.stdpath("data")
        vim.fn.delete(dat .. "/shada/main.shada")
        vim.fn.delete(dat .. "/undodir", "rf")
    end,
    {}
)

vim.api.nvim_create_user_command("PackUpdate", function() vim.pack.update() end, {})
vim.api.nvim_create_user_command(
    "PackClean",
    function()
        local inactive = {}
        for _, p in ipairs(vim.pack.get()) do
            if not p.active then table.insert(inactive, p.spec.name) end
        end
        if #inactive > 0 then
            vim.pack.del(inactive)
            vim.print("Removed " .. table.concat(inactive, ", "))
        end
    end,
    {}
)
