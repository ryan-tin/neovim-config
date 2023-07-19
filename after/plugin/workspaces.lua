require("workspaces").setup({
  hooks = {
    -- save workspace session before changing workspace
    open_pre = function()
      require("sessions").save("./.session", {})
      -- then close all buffers
      vim.cmd(":silent %bd")
    end,
    -- load workspace session on selecting workspace
    open = function()
      require("sessions").load("./.session", {})
    end,

    -- create a session file when workspace is added
    add = function()
      require("sessions").save("./.session", {})
    end
  }
})
