local wk = require("which-key")
local presets = require("which-key.plugins.presets")
presets.operators["v"] = nil

wk.setup()

vim.o.timeout = true
vim.o.timeoutlen = 150 -- in milliseconds

-- document and/or setup your own mappings
wk.register({
  ["<leader>"] = {
    s = { name = "[S]earch" },
    g = { name = "[G]it", t = { name = "[T]oggle", }, },
    q = { name = "[Q]uarto" },
    p = { name = "[P]aste" },
    l = { name = "[L]sp" },
    t = { name = "[T]rouble", },
    -- m = { name = "[M]olten" },
    c = { name = "[C]reate" },
    r = { name = "[R]ename" }
  },
})
