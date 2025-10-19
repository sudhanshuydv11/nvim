require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"lua_ls",
		"jdtls",
		"biome@2.0.6",
		"biome@2.2.4",
	},
})
