require('mason').setup()

-- Setup Mason LSP Config
require('mason-lspconfig').setup({
    ensure_installed = { "ts_ls", "biome", "lua_ls" },  -- Add any other language servers you want to install
})

