-- empty setup using defaults
require("nvim-tree").setup()

local api = require("nvim-tree.api")

-- open nvimtree
-- vim.keymap.set("n", "<leader>e", ":w<CR>", { silent = true })

-- OR setup with some options
-- require("nvim-tree").setup({
--   sort = {
--     sorter = "case_sensitive",
--   },
--   view = {
--     width = 30,
--   },
--   renderer = {
--     group_empty = true,
--   },
--   filters = {
--     dotfiles = true,
--   },
-- })
