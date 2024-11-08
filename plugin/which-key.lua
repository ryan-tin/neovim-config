local wk = require("which-key")

wk.setup({
  delay = 1000, -- time in ms to wait before showing menu
  plugins = {
    presets = {
      operators = true,    -- adds help for operators like d, y, ...
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  }
})

wk.add({
  { "<leader>c",  group = "[C]hange" },
  { "<leader>d",  group = "[D]ap/[D]adbod" },
  { "<leader>g",  group = "[G]it" },
  { "<leader>gt", group = "[T]oggle" },
  { "<leader>l",  group = "[L]sp" },
  { "<leader>m",  group = "[M]arkdown" },
  { "<leader>p",  group = "[P]aste" },
  { "<leader>r",  group = "[R]ename" },
  { "<leader>s",  group = "[S]earch" },
  { "<leader>t",  group = "[T]rouble" },
  { "<leader>n",  group = "[N]ext" },
  { "<leader>N",  group = "Previous" },
})
