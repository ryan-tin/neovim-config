vim.g.slime_target = "tmux"
vim.cmd("let g:slime_default_config = {\"socket_name\": \"default\", \"target_pane\": \"{right-of}\"}")
-- FIX: how to use terminal inside neovim?

-- vim.keymap.set("n", "<C-CR>", "<Plug>SlimeLineSend", {desc = "slime send cell"})
