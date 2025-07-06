require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"lua_ls",
		"jdtls",
		"biome@2.0.0-beta.6",
		"biome@2.0.6",
	},
})
