local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require('telescope').setup{
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

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fp', builtin.resume, { silent = true })
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- lsp
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { silent = true })
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>fv', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

-- search commonly used directories
vim.keymap.set("n", "<leader>fcc", ":Telescope find_files cwd=~/.config/nvim/<CR>", {silent = true})
vim.keymap.set("n", "<leader>fcv", ":Telescope find_files cwd=~/BrainVault/<CR>", {silent = true})
vim.keymap.set("n", "<leader>fcu", ":Telescope find_files cwd=~/Useful_Texts/<CR>", {silent = true})
