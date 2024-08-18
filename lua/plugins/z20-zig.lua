-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-lldb-vscode
-- https://terminalprogrammer.com/neovim-setup-for-zig
-- :lua print(vim.fn.getcwd())

-- if true then return {} end

return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"

      -- sudo apt install lldb (for the command)
      dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode',
        name = 'lldb'
      }
      dap.configurations.zig = {
        {
          name = 'Launch',
          type = 'lldb',
          request = 'launch',
          program = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
          runInTerminal = false,
        }
      }
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    config = function(plugin, opts)
      -- run default AstroNvim nvim-dap-ui configuration function
      require("astronvim.plugins.configs.nvim-dap-ui")(plugin, opts)

      local dapui = require "dapui"
      local dap = require "dap"

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end
  },
}
