require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"lua_ls",
		"jdtls",
		"jsonls",
		"biome@2.0.0-beta.6",
		"biome@2.0.6",
		"biome@2.2.4",
	},
})
