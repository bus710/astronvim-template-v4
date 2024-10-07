-- https://docs.astronvim.com/recipes/mappings/

return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          gn = {
            function()
              vim.keymap.set(
                "n",
                "gn",
                function()
                  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
                end)
            end,
            desc = "Disable vim diagnostic info",
          },
          gm = {
            function()
              vim.keymap.set("n", "gm", vim.diagnostic.enable)
            end,
            desc = "Enable vim diagnostic info",
          }
        },
      },
    },
  },
}
