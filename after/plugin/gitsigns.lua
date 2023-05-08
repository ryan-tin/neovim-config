local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    return
end

gitsigns.setup {
    signs = {
        add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = true, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    diff_opts = {
        internal = true -- required to show word diff
    },
    watch_gitdir = {
        interval = 1000,
        follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = false,
    },
    current_line_blame_formatter_opts = {
        relative_time = false,
    },
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000,
    preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
    },
    yadm = {
        enable = false,
    },
}

vim.keymap.set("n", "<leader>gh", ":Gitsigns preview_hunk_inline<CR>", { silent = true })
vim.keymap.set("n", "<leader>gf", ":Gitsigns preview_hunk<CR>", { silent = true })
vim.keymap.set("n", "]h", ":Gitsigns next_hunk<CR>", { silent = true })
vim.keymap.set("n", "[h", ":Gitsigns prev_hunk<CR>", { silent = true })
-- toggles
vim.keymap.set("n", "<leader>gtb", ":Gitsigns toggle_current_line_blame<CR>", { silent = true })
vim.keymap.set("n", "<leader>gtw", ":Gitsigns toggle_word_diff<CR>", { silent = true })
vim.keymap.set("n", "<leader>gtd", ":Gitsigns toggle_deleted<CR>", { silent = true })
