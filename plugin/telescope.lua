local telescope = require('telescope')
local actions = require('telescope.actions')
local trouble = require("trouble.sources.telescope")

telescope.setup({
  defaults = {
    -- winblend = 10,
    layout_strategy = "flex",
    mappings = {
      n = {
        ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-t>"] = trouble.open
      },
      i = { ["<C-t>"] = trouble.open_with_trouble, }
    },
  },
  pickers = {
    buffers = {
      mappings = {
        i = { ["<C-b>"] = actions.delete_buffer },
        n = { ["<C-b>"] = actions.delete_buffer },
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown(),
    },
  },
})

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')
