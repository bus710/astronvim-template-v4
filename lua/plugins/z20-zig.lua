-- https://terminalprogrammer.com/neovim-setup-for-zig
-- :lua print(vim.fn.getcwd())

return {


  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   optional = true,
  --   opts = function(_, opts)
  --     if opts.ensure_installed ~= "all" then
  --       opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, { "zig" })
  --     end
  --   end,
  -- },
  -- {
  --   "nvim-neotest/neotest",
  --   optional = true,
  --   dependencies = { "lawrence-laz/neotest-zig", version = "^1" },
  --   opts = function(_, opts)
  --     if not opts.adapters then opts.adapters = {} end
  --     table.insert(opts.adapters, require "neotest-zig")
  --   end,
  -- },
  -- {
  --   "https://codeberg.org/NTBBloodbath/zig-tools.nvim",
  --   -- Load zig-tools.nvim only in Zig buffers
  --   ft = { "zig" },
  --   opts = {},
  --   dependencies = {
  --     "akinsho/toggleterm.nvim",
  --     "nvim-lua/plenary.nvim",
  --   },
  -- },
  -- {
  --   "AstroNvim/astrolsp",
  --   optional = true,
  --   ---@type AstroLSPOpts
  --   opts = {
  --     servers = { "zls" },
  --   },
  -- },

  ----------------------------------------------
  ----------------------------------------------

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
          -- program = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
          program = './zig-out/bin/${workspaceFolderBasename}',
          -- program = "${command:pickFile}";
          -- program = vim.fn.getcwd() .. '/zig-out/bin/${workspaceFolderBasename}',
          -- program = function()
          --   return vim.fn.input({
          --     prompt = 'Path to executable for zig: ',
          --     -- default = vim.fn.getcwd() .. '/',
          --     defailt = '${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}',
          --     completion = 'file',
          --   })
          -- end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
          runInTerminal = false,
        }
      }

      local dapui = require "dapui"
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
      end
    end,
  },
}
