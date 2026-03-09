local M = {}

M.parsers = {
    "asm",
    "bash",
    "c",
    "cpp",
    "diff",
    "dockerfile",
    "git_config",
    "gitcommit",
    "gitignore",
    "haskell",
    "html",
    "ini",
    "javascript",
    "json",
    "linkerscript",
    "make",
    "markdown",
    "nix",
    "ocaml",
    "python",
    "rust",
    "ssh_config",
    "tmux",
    "toml",
    "typst",
    "vim",
    "vimdoc",
    "xml",
    "yaml",
    "zig",
}

M.ignored_langs = {
    "oil",
}

M.setup = function()
    require("nvim-treesitter").install(M.parsers)
    vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
            local buf, filetype = args.buf, args.match
            local lang = vim.treesitter.language.get_lang(filetype)
            if not lang or vim.tbl_contains(M.ignored_langs, lang) then return end
            if not vim.treesitter.language.add(lang) then
                vim.print("Treesitter lang " .. lang .. " missing")
                return
            end
            vim.treesitter.start(buf, lang)
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
    })
end

return M
