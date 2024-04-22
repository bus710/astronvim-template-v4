--[[ 
Prerequisites:
- sudo apt install lldb
- rustup add component rust-analyzer
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
