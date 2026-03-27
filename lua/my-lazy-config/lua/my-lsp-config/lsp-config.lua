local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }

local lspconfig = require("lspconfig")

lspconfig.ts_ls.setup({
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("tsconfig.json"),

	settings = {
		documentFormatting = false,
	},
})

lspconfig.svelte.setup({})

lspconfig.lua_ls.setup({
	capabilities = capabilities,
})

lspconfig.biome.setup({
	capabilities = capabilities,
	cmd = { "node_modules/.bin/biome", "lsp-proxy" },
	root_dir = lspconfig.util.root_pattern("biome.json"),
})

lspconfig.jdtls.setup({
	capabilities = capabilities,
	root_dir = lspconfig.util.root_pattern("pom.xml", "build.gradle", "settings.gradle", ".git"),
})

lspconfig.lemminx.setup({})
lspconfig.jsonls.setup({})

lspconfig.eslint.setup({
	root_dir = lspconfig.util.root_pattern("eslint.config.js"),
	settings = {
		eslint = {
			nodePath = "./node_modules", -- use project's eslint
		},
	},
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})

-- Stylelint
lspconfig.stylelint_lsp.setup({
	root_dir = lspconfig.util.root_pattern(".stylelintrc"),
	filetypes = { "css", "scss" },
	settings = {
		stylelintplus = {
			autoFixOnSave = true,
			-- use project's stylelint binary
			stylelintConfigBasedir = vim.fn.getcwd(),
		},
	},
})
