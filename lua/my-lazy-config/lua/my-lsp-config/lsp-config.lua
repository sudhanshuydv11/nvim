local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
-- Configure the Biome LSP
local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("tsconfig.json"),

	settings = {
		documentFormatting = false,
	},
})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

lspconfig.biome.setup({
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("biome.json"),
})

lspconfig.jdtls.setup({
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", "settings.gradle", ".git"),
})

lspconfig.lemminx.setup({})
lspconfig.jsonls.setup({})
