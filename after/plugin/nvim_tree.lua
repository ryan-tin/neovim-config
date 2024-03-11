require("nvim-tree").setup({
  disable_netrw = true,
  update_focused_file = {
    enable = true,
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
  diagnostics = {
    enable = true,
  },
})
