-- keymaps to escape terminal mode and switch windows
local function set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<c-\><c-n>]], opts)
  vim.keymap.set("t", "<c-w>", [[<c-\><c-n><c-w>]], opts)

  -- vim.keymap.set("t", "<c-w>h", [[<cmd>wincmd h<cr>]], opts)
  -- vim.keymap.set("t", "<C-w>j", [[<Cmd>wincmd j<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>k", [[<Cmd>wincmd k<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>l", [[<Cmd>wincmd l<CR>]], opts)
  -- -- changing tabs
  -- vim.keymap.set("t", "<C-w>n", [[<Cmd>tabprevious<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>p", [[<Cmd>tabnext<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>1", [[<Cmd>tabn1<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>2", [[<Cmd>tabn2<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>3", [[<Cmd>tabn3<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>4", [[<Cmd>tabn4<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>5", [[<Cmd>tabn5<CR>]], opts)
  -- -- close
  -- vim.keymap.set("t", "<C-w>c", [[<Cmd>close<CR>]], opts)
  -- -- splits
  -- vim.keymap.set("t", "<C-w>v", [[<Cmd>vs<CR>]], opts)
  -- vim.keymap.set("t", "<C-w>s", [[<Cmd>sv<CR>]], opts)
end

vim.api.nvim_create_autocmd({ "TermOpen" }, {
  pattern = { "*" },
  callback = function(_)
    vim.cmd.setlocal("nonumber")
    set_terminal_keymaps()
  end,
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
