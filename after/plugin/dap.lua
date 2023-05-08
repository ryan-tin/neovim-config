local dap = require('dap')

-- how to setup for other languages?

dap.adapters.codelldb = {
    type = 'server',
    host = "127.0.0.1",
    port = "${port}",
    executable = {
        -- command = vim.fn.stdpath("data") .. '/mason/bin/codelldb',
        command = "/Users/ryantin/.local/share/nvim/mason/bin/codelldb",
        args = {"--port", "${port}"},
    }
}

dap.configurations.cpp = {
  {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
          -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          return vim.fn.input('Path to executable: ')
      end,
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
  },
}

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>dj', function() require('dap').up() end)
vim.keymap.set('n', '<Leader>dk', function() require('dap').down() end)
vim.keymap.set('n', '<Leader>dJ', function() require('dap').goto_() end)
vim.keymap.set('n', '<Leader>dR', function() require('dap').run_to_cursor() end)
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end)
---
-- does not work
vim.keymap.set('n', '<Leader>dB', function() require('dap').list_breakpoints() end)
---
vim.keymap.set('n', '<Leader>dc', function() require('dap').clear_breakpoints() end)
vim.keymap.set('n', '<Leader>dL', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set('n', '<Leader>dx', function() require('dap').terminate() end)
vim.keymap.set('n', '<Leader>dt', function() require('dapui').toggle() end)
vim.keymap.set({'n', 'v'}, '<Leader>di', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dI', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)
