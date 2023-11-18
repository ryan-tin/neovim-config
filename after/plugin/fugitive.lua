-- vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gs", "<cmd>vertical G<CR>");

-- avoid accidental push...
-- vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>");

-- send all git diffs to quickfix list
vim.keymap.set("n", "<leader>gq", "<cmd>Git difftool<CR>");
