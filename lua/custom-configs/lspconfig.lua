vim.diagnostic.config({
    virtual_text =false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-8" }

-- Configure the Biome LSP
local lspconfig = require('lspconfig')



lspconfig.ts_ls.setup({
capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("tsconfig.json"),

  settings = {
    documentFormatting = false,
  },

})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }, -- Recognize the `vim` global
      },
	telemetry = { enable = false },
    },
  },
})

lspconfig.biome.setup({
capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("biome.json")
})

