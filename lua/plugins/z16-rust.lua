--[[ 
Prerequisites:
- sudo apt install lldb
- rustup component add rust-analyzer

To start the dap-ui:
- :RustLsp debuggables

If the dap-ui doesn't start well, check the LSP log
- :LspInfo
- :LspLog
- :lua vim.lsp.buf.definition() on a token

If Mason keeps failing codelldb, delete the lock file with
- rm -rf $HOME/.local/share/nvim/mason/staging/codelldb.lock
]]--



return {
  -- If RustAnalyzer crashes
  --   rustup component add rust-analyzer
  -- To launch the debugger
  --   :RustLsp debuggables
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    lazy = false,
    options = {}
  },
  { "Saecki/crates.nvim"},
}
