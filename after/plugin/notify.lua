vim.notify = require("notify") -- make notify the default

require("notify").setup({
  background_colour = "#000000", -- default color
})

vim.keymap.set('n', '<leader>fm', '<cmd>Telescope notify<CR>', { silent = true })
