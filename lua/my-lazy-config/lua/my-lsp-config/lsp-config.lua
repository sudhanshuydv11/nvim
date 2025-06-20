local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

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
	capabilities = capabilities
})

lspconfig.biome.setup({
capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern("biome.json")
})

