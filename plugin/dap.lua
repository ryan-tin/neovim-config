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
    name = "Codelldb: Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/main', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    preRunCommands = {
      'breakpoint delete cpp_exception',
    }
  },
}

dap.configurations.objcpp = dap.configurations.cpp
