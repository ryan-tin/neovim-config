local builtin = require('telescope.builtin')
require('telescope').load_extension('aerial')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<CR>', { silent = true })
vim.keymap.set('n', '<leader>fr', '<cmd>Telescope resume<CR>', { silent = true })
vim.keymap.set('n', '<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>fa', '<cmd>Telescope aerial<CR>', { silent = true })

-- search config files with Telescope
vim.keymap.set("n", "<leader>fc", ":Telescope find_files cwd=~/.config/nvim/<CR>")
-- search BrainVault files with Telescope
vim.keymap.set("n", "<leader>fv", ":Telescope find_files cwd=~/BrainVault/<CR>")

vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
-- vim.keymap.set('n', '<leader>fv', builtin.lsp_document_symbols, {}) -- this overlaps with vault

-- lots of other cool stuff possible with Telescope, incling
-- quickfix
-- workspace symbols
