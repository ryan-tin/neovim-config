-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups, handled in set.lua
-- vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
  sync_root_with_cwd = true,   -- useful when changing workspaces
  sort_by = "case_sensitive",
  auto_reload_on_write = true,
  view = {
    side = "left",
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u",     action = "dir_up" },
        { key = "<C-e>", action = "" }
      },
    },
  },
  renderer = {
    add_trailing = true,
    group_empty = false,
    highlight_git = true,
    root_folder_modifier = ":t",
    indent_width = 2,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      padding = " ",
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      -- hint = "",
      -- info = "",
      -- warning = "",
      -- error = "",

      -- letters are less confusing
      error = 'E',
      warning = 'W',
      hint = 'H',
      info = 'I'
    },
  },
  filters = {
    dotfiles = false,
  },
  live_filter = {
    always_show_folders = false,
  }
})
