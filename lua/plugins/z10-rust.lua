--[[ 
Prerequisites:
- sudo apt install lldb
- rustup component add rust-analyzer
]]--

return {
  -- To launch the debugger
  -- :RustLsp debuggables
  {
    'mrcjkb/rustaceanvim',
    version = '^4',
    lazy = false,
    options = {}
  },
  { "Saecki/crates.nvim"},
}
