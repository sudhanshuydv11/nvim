require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ts_ls",
		"lua_ls",
		"stylua",
		"jdtls",
		"jsonls",
	},
})
