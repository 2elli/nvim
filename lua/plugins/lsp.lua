vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/stevearc/conform.nvim" },
    { src = "https://github.com/mfussenegger/nvim-lint" },
})

-- servers
require("mason").setup()

-- formatter
require("conform").setup({
    default_format_opts = { lsp_format = "fallback", async = true },
    formatters_by_ft = {
        ocaml = { "ocamlformat" },
    },
})
vim.keymap.set("n", "<leader>lf", function() require("conform").format() end, { desc = "lsp format" })

-- linter
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    -- linter by ft
    -- require("lint").try_lint()
    -- global linter
    require("lint").try_lint("typos")
  end,
})
