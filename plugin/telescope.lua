local telescope = require('telescope')
local actions = require('telescope.actions')
-- local trouble = require("trouble.sources.telescope")

telescope.setup({
  defaults = {
    -- winblend = 10,
    treesitter = true,
    layout_strategy = "flex",
    mappings = {
      -- FIXME: this opens file in new tab too
      -- i = {
      --   ["<cr>"] = function(bufnr)
      --     -- jump to the tab that this file is open already
      --     require("telescope.actions.set").edit(bufnr, "tab drop")
      --   end
      -- },
      n = {
        ["<C-s>"] = actions.send_selected_to_qflist + actions.open_qflist,
        -- ["<cr>"] = function(bufnr)
        --   -- same as in insert mode
        --   require("telescope.actions.set").edit(bufnr, "tab drop")
        -- end
        -- ["<C-t>"] = trouble.open
      },
      -- i = { ["<C-t>"] = trouble.open_with_trouble, }
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
