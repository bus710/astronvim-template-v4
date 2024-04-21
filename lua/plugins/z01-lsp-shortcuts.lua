return {
  -- The entire config came from:
  -- https://elixirforum.com/t/getting-heex-and-h-working-in-nvim-with-astronvim/54779/16
  -- https://github.com/treshenry/astronvim_config/blob/main/init.lua

  --[[ 
  --]]

  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
      vim.keymap.set("n", "gn", vim.diagnostic.disable, opts)
      vim.keymap.set("n", "gm", vim.diagnostic.enable, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<space>wl", function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
      vim.keymap.set("n", "<space>tD", vim.lsp.buf.type_definition, opts)
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
      vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end, opts)

      -- vim.api.nvim_create_autocmd("BufWritePre", {
      --   buffer = buffer,
      --   callback = function()
      --       vim.lsp.buf.format { async = false }
      --   end
      -- })
    end,
  }),

}

--   local lspconfig = require "lspconfig"
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--
--     --Enable (broadcasting) snippet capability for completion
--     capabilities.textDocument.completion.completionItem.snippetSupport = true
--
--     -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
--     lspconfig.html.setup {
--       capabilities = capabilities,
--       cmd = { "vscode-html-language-server", "--stdio" },
--       filetypes = { "html", "elixir", "eelixir", "heex", "svelte" },
--     }
--
--     -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html
--     lspconfig.tailwindcss.setup {
--       capabilities = capabilities,
--       root_dir = lspconfig.util.root_pattern(
--         "tailwind.config.js",
--         "tailwind.config.ts",
--         "postcss.config.js",
--         "postcss.config.ts",
--         "package.json",
--         "node_modules",
--         ".git",
--         "mix.exs"
--       ),
--       filetypes = { "html", "elixir", "eelixir", "heex", "svelte" },
--       init_options = {
--         userLanguages = {
--           elixir = "html-eex",
--           eelixir = "html-eex",
--           heex = "html-eex",
--         },
--       },
--       settings = {
--         tailwindCSS = {
--           experimental = {
--             classRegex = {
--               'class[:]\\s*"([^"]*)"',
--             },
--           },
--         },
--       },
--     }
--
--     lspconfig.emmet_ls.setup {
--       capabilities = capabilities,
--       filetypes = {
--         "html",
--         "typescriptreact",
--         "javascriptreact",
--         "css",
--         "sass",
--         "scss",
--         "less",
--         "elixir",
--         "eelixir",
--         "heex",
--       },
--     }
--
--     local cmp = require "cmp"
--     local lspkind = require "lspkind"
--
--     cmp.setup {
--       window = {
--         completion = {
--           col_offset = -3, -- align the abbr and word on cursor (due to fields order below)
--         },
--       },
--       formatting = {
--         fields = { "kind", "abbr", "menu" },
--         format = lspkind.cmp_format {
--           mode = "symbol_text", -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
--           maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
--           menu = { -- showing type in menu
--             nvim_lsp = "[LSP]",
--             path = "[Path]",
--             buffer = "[Buffer]",
--             luasnip = "[LuaSnip]",
--           },
--           before = function(entry, vim_item) -- for tailwind css autocomplete
--             if vim_item.kind == "Color" and entry.completion_item.documentation then
--               local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
--               if r then
--                 local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
--                 local group = "Tw_" .. color
--                 if vim.fn.hlID(group) < 1 then vim.api.nvim_set_hl(0, group, { fg = "#" .. color }) end
--                 vim_item.kind = "■" -- or "⬤" or anything
--                 vim_item.kind_hl_group = group
--                 return vim_item
--               end
--             end
--             -- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
--             -- or just show the icon
--             vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
--             return vim_item
--           end,
--         },
--       },
--     }
--   end,
-- }
