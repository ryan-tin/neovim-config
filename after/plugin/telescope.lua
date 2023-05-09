local builtin = require('telescope.builtin')
require('telescope').load_extension('aerial')

require('telescope').setup({
    defaults = {
        mappings = {
            i = {
                ["<C-h>"] = "which_key",
                ['x'] = require("telescope.actions").delete_buffer
            },
            n = {
                ['x'] = require("telescope.actions").delete_buffer
            }
        }
    },
})

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
vim.keymap.set("n", "<leader>fc", ":Telescope find_files cwd=~/.config/nvim/<CR>") -- search config
vim.keymap.set("n", "<leader>fv", ":Telescope find_files cwd=~/BrainVault/<CR>") -- serach vault
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})
-- vim.keymap.set('n', '<leader>fv', builtin.lsp_document_symbols, {}) -- this overlaps with vault
vim.keymap.set('n', '<leader>fm', "<cmd>Telescope notify<CR>", {silent = true})

-- lots of other cool stuff possible with Telescope, incling
-- quickfix
-- workspace symbols
