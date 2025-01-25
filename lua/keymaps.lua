-- keybinds --
local M = {}

--- Sets default keymaps that do not require plugins
M.builtin_binds = function()
    vim.g.mapleader = " "
    vim.keymap.set("n", "<SPACE>", "<Nop>")
    vim.keymap.set("n", "<leader>w", "<CMD>w<CR>")
    -- keep page dwn + up centered
    vim.keymap.set("n", "<C-d>", "<C-d>zz")
    vim.keymap.set("n", "<C-u>", "<C-u>zz")
    -- keep searching dwn + up centered
    vim.keymap.set("n", "n", "nzzzv")
    vim.keymap.set("n", "N", "Nzzzv")
    -- clear search highlight
    vim.keymap.set("n", "<Esc>", "<CMD>nohlsearch<CR>")
    -- meta + j|k to move selection
    vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
    vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
    vim.keymap.set("n", "<M-j>", ":m .+1<CR>==")
    vim.keymap.set("n", "<M-k>", ":m .-2<CR>==")
    -- append next line
    vim.keymap.set("n", "J", "mzJ`z")
    -- append this line to next
    vim.keymap.set("n", "<M-J>", "mzj:m .-2<CR>==J`z")
    -- delete without copying to register
    vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
    -- tabs
    vim.keymap.set("n", "<leader>te", "<CMD>tabe<CR>")
    vim.keymap.set("n", "<leader>tc", "<CMD>tabc<CR>")
    vim.keymap.set("n", "<leader>>", "<CMD>+tabm<CR>")
    vim.keymap.set("n", "<leader><", "<CMD>-tabm<CR>")
end

--- Sets all lsp keybindings
---@param opts table  # "opts" table with buffer to be used in keymap
M.lsp_binds = function(opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gy", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("v", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>", opts)
    vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
    local conform = require("conform")
    vim.keymap.set({ "n", "v" }, "<leader>lf", function() conform.format({ bufnr = opts.buffer }) end, opts)
end

--- Sets keybinds for all plugins
M.plugin_binds = function()
    -- harpoon marks
    local harpoon = require("harpoon")
    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>f", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    vim.keymap.set("n", "<C-n>", function() harpoon:list():next() end)
    vim.keymap.set("n", "<C-p>", function() harpoon:list():prev() end)

    -- snippets
    local scissors = require("scissors")
    vim.keymap.set("n", "<leader>se", function() scissors.editSnippet() end)
    vim.keymap.set({ "n", "x" }, "<leader>sa", function() scissors.addNewSnippet() end)

    -- toggle oil file "tree"
    local oil = require("oil")
    vim.keymap.set("n", "<leader>e", function() oil.toggle_float() end)

    -- telescope fzf
    local telescope_builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>/", telescope_builtin.live_grep, {})
    vim.keymap.set("n", "<leader>F", telescope_builtin.find_files, {})
    vim.keymap.set("n", "<leader>tt", telescope_builtin.builtin, {})
    vim.keymap.set("n", "<leader>t\"", telescope_builtin.registers, {})
    vim.keymap.set("n", "<leader>tb", telescope_builtin.buffers, {})
    vim.keymap.set("n", "<leader>tq", telescope_builtin.quickfix, {})
    vim.keymap.set("n", "<leader>tj", telescope_builtin.jumplist, {})

    -- sessions
    vim.keymap.set("n", "<leader>sw", "<CMD>SessionSave<CR>")
    vim.keymap.set("n", "<leader>ss", "<CMD>Telescope persisted<CR>")
    vim.keymap.set("n", "<leader>sc", "<CMD>SessionLoad<CR>")
    vim.keymap.set("n", "<leader>sl", "<CMD>SessionLoadLast<CR>")

    -- trouble
    vim.keymap.set("n", "<leader>xx", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>")
    vim.keymap.set("n", "<leader>xX", "<CMD>Trouble diagnostics toggle<CR>")

    -- git
    vim.keymap.set("n", "<leader>gg", "<CMD>Gitsigns<CR>")
    vim.keymap.set("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>")
    vim.keymap.set("n", "<leader>gB", "<CMD>Gitsigns blame<CR>")
    vim.keymap.set("n", "<leader>gd", "<CMD>vert rightb Gitsigns diffthis<CR>")
    vim.keymap.set("n", "<leader>gn", "<CMD>Gitsigns next_hunk<CR>")
    vim.keymap.set("n", "<leader>gp", "<CMD>Gitsigns prev_hunk<CR>")

    -- marks
    vim.keymap.set("n", "<leader>m", "<CMD>MarksListAll<CR>")

    -- undo tree
    vim.keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR>")

    -- scratch files
    vim.keymap.set("n", "<leader>bb", function() Snacks.scratch() end)
    vim.keymap.set("n", "<leader>bs", function() Snacks.scratch.select() end)

    ---- some automatically setup binds ----
    --[[ Comment.nvim
    -- NORMAL --
    gcc               - Toggles the current line using linewise comment
    gbc               - Toggles the current line using blockwise comment
    [count]gcc        - Toggles the number of line given as a prefix-count using linewise
    [count]gbc        - Toggles the number of line given as a prefix-count using blockwise
    gc[count]{motion} - (Op-pending) Toggles the region using linewise comment
    gb[count]{motion} - (Op-pending) Toggles the region using blockwise comment
    -- VISUAL --
    gc                - Toggles the region using linewise comment
    gb                - Toggles the region using blockwise comment
    ]]

    --[[ marks.nvim
    mx                - Set mark x
    m,                - Set the next available alphabetical (lowercase) mark
    m;                - Toggle the next available mark at the current line
    dmx               - Delete mark x
    dm-               - Delete all marks on the current line
    dm<space>         - Delete all marks in the current buffer
    m]                - Move to next mark
    m[                - Move to previous mark
    m:                - Preview mark. This will prompt you for a specific mark to preview; press <cr> to preview the next mark.
    m[0-9]            - Add a bookmark from bookmark group[0-9].
    dm[0-9]           - Delete all bookmarks from bookmark group[0-9].
    m}                - Move to the next bookmark having the same type as the bookmark under the cursor. Works across buffers.
    m{                - Move to the previous bookmark having the same type as the bookmark under the cursor. Works across buffers.
    dm=               - Delete the bookmark under the cursor.
    ]]
end

---Returns table used by blink to set cmp keybinds
M.blink_binds = function()
    return {
        -- use default keys as base
        preset = "default",
        -- add "super-tab" like actions
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
    }
end

return M
