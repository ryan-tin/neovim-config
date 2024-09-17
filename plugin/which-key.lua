local wk = require("which-key")
local presets = require("which-key.plugins.presets")
-- Dont show hints for these
presets.operators["v"] = nil
presets.operators["d"] = nil


-- FIX: below doesn't work. don't show wk window for <C-w>
presets.operators["<C-w>"] = nil
presets.windows = nil

wk.setup({
  triggers_nowait = {}, -- always wait
})

vim.o.timeout = true
vim.o.timeoutlen = 500 -- in milliseconds

-- document and/or setup your own mappings
wk.register({
  ["<leader>"] = {
    s = { name = "[S]earch" },
    g = { name = "[G]it", t = { name = "[T]oggle", }, },
    -- q = { name = "[Q]uarto" },
    p = { name = "[P]aste" },
    l = { name = "[L]sp" },
    t = { name = "[T]rouble", },
    r = { name = "[R]ename" },
    c = { name = "[C]reate" },
    d = { name = "[D]ap" },
    m = { name = "[M]arkdown" }
  },
})
