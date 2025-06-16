vim.diagnostic.config({
  update_in_insert = true,
})
-- Configure the Biome LSP
local lspconfig = require('lspconfig')

lspconfig.biome.setup({
  root_dir = function(fname)
          return lspconfig.util.root_pattern("biome.json")(fname)
            or lspconfig.util.find_package_json_ancestor(fname)
            or lspconfig.util.find_node_modules_ancestor(fname)
            or lspconfig.util.find_git_ancestor(fname)
        end,
  settings = {
    -- Add any specific settings for Biome here
  },
})

--[[lspconfig.ts_ls.setup({
  root_dir = lspconfig.util.root_pattern("tsconfig.json"),
  settings = {
    documentFormatting = false, -- Disable formatting to avoid conflicts
  },
})
	]]--

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }, -- Recognize the `vim` global
      },
	telemetry = { enable = false },
    },
  },
})

