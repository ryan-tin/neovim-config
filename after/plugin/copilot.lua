vim.g.copilot_assume_mapped = true
vim.g.copilot_no_tab_map = true
vim.g.copilot_filetypes = { xml = false }

-- Tips
-- <C-E> to close cmp (cmp suggestions can block copilot suggestions)
-- <C-]> to dismiss a suggestion (by default)

-- use <C-J> or <Tab> to accept copilot suggestions
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  silent = true
})

-- TODO: <C-K> suggests a new completion, or dismisses a suggestion
-- a suggestion, even if copilot is disabled
vim.keymap.set('i', '<C-K>', '<Plug>(copilot-suggest)')
-- dismiss suggestion
vim.keymap.set('i', '<C-C>', '<Plug>(copilot-dismiss)')

-- cycle suggestions
vim.keymap.set('i', '<C-H>', '<Plug>(copilot-previous)')
vim.keymap.set('i', '<C-L>', '<Plug>(copilot-next)')

-- TODO: maps for accept line or accept word?
