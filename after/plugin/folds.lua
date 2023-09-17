-- remember folds
vim.cmd([[
  augroup remember_folds
    autocmd!
    autocmd BufWinLeave ?* mkview
    autocmd BufWinEnter ?* silent! loadview
  augroup END
]])

-- FIX: toggling nvim-tree with an unamed buffer throws error
