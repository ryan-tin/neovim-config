local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup{
    defaults = {},
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<C-b>"] = actions.delete_buffer
                },
                n = {
                    ["<C-b>"] = actions.delete_buffer
                },
            }
        }
    }
}

-- git
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
-- checkout action with <CR>, reset mixed <C-r>m, reset soft <C-r>s, and reset hard <C-r>h
vim.keymap.set('n', '<leader>gF', builtin.git_bcommits, {}) -- preview buffer commits
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
-- Lists all branches with log preview, checkout action <cr>, track action <C-t>,
-- rebase action<C-r>, create action <C-a>, switch action <C-s>, delete action <C-d> and merge action <C-y>
vim.keymap.set('n', '<leader>gS', builtin.git_stash, {})

-- general
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', builtin.resume, { silent = true })
vim.keymap.set('n', '<leader>fg', function() builtin.grep_string({ search = vim.fn.input("Grep > ") }); end)
vim.keymap.set('n', '<leader>fs', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fw', ":Telescope workspaces<CR>", {silent=true})

-- lsp
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { silent = true })
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>fv', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

-- search commonly used directories
vim.keymap.set("n", "<leader>fcc", ":Telescope find_files cwd=~/.config/nvim/<CR>", {silent = true})
vim.keymap.set("n", "<leader>fcv", ":Telescope find_files cwd=~/BrainVault/<CR>", {silent = true})
vim.keymap.set("n", "<leader>fcu", ":Telescope find_files cwd=~/Useful_Texts/<CR>", {silent = true})

telescope.load_extension("workspaces")
