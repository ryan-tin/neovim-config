-- slime
vim.g.slime_target = 'tmux'
-- vim.g.slime_default_config = { socket_name = "default", target_pane = ":1.0" } -- the 1st window, 0th pane
vim.g.slime_default_config = { socket_name = "default", target_pane = "0" } -- this window, 0th pane
-- vim.g.slime.default_config = { session_name: "nvim", windowname: "0"}
vim.g.slime_python_ipython = 1
vim.g.slime_bracketed_paste = 1
