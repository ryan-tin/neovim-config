local dap, dapui = require("dap"), require("dapui")

-- automatically open and close dap ui when debugging
dap.listeners.before.attach.dapui_config = function() dapui.open() end
dap.listeners.before.launch.dapui_config = function() dapui.open() end
dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

-- CPP configuration. do not touch
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    -- command = '/absolute/path/to/codelldb/extension/adapter/codelldb',
    command = '/Users/ryantin/.local/share/nvim/mason/bin/codelldb',
    args = { "--port", "${port}" },
  },
}


dap.configurations.cpp = {
  {
    name = "Default launch",
    type = "codelldb",
    request = "launch",
    program = function()
      -- local current = "build/tests/DbIteratorTest"
      -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/' .. current, 'file')
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    preRunCommands = {
      'breakpoint delete cpp_exception',
    }
  },
}

require('dap.ext.vscode').load_launchjs(nil, { cppdbg = { 'c', 'cpp', 'objcpp' } })

-- one of these worked, idk which one!
-- dap.set_exception_breakpoints({}) -- don't stop on any exceptions
require('dap').defaults.fallback.exception_breakpoints = {}
require('dap').defaults.cpp.exception_breakpoints = {}

dap.configurations.objcpp = dap.configurations.cpp

-- require("dap").configurations.python = {
--     type = "python",
--     request = "launch",
--     name = "Module",
--     console = "integratedTerminal",
--     module = "src", -- edit this to be your app's main module
--     cwd = "${workspaceFolder}",
--     -- cwd = vim.fn.getcwd(),
-- }
