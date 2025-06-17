require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'ts_ls',
    'lua_ls',
    'biome@2.0.0-beta.5',
  },
})
