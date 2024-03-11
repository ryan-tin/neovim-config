-- keymaps to escape terminal mode and switch windows
local function set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-w>h", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-w>j", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-w>k", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-w>l", [[<Cmd>wincmd l<CR>]], opts)
end

vim.api.nvim_create_autocmd({ "TermOpen" }, {
	pattern = { "*" },
	callback = function(_)
		vim.cmd.setlocal("nonumber")
		set_terminal_keymaps()
	end,
})

-- FIX: error when closing nvimtree on alpha
-- convert to lua

-- remember folds
vim.cmd([[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave ?* mkview
    autocmd BufWinEnter ?* silent! loadview
  augroup END
]])

-- markdown files wrap
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = { '*.md' },
  command = 'setlocal wrap'
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
