local lspconfig = require('lspconfig')

vim.diagnostic.config({
  update_in_insert = true,
})

-- Configure the Biome LSP
lspconfig.biome.setup({
    filetypes = { "biome", "typescript", "typescriptreact", "typescript.tsx" },       -- Specify the file types the LSP should handle
    root_dir = lspconfig.util.root_pattern(".git", "package.json", "biome.json"),  -- Adjust root detection
    settings = {
        -- Add any specific settings for Biome here
    },
})

lspconfig.ts_ls.setup({
    	root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),  -- Adjust root detection
    	settings = {
        -- Add any specific settings for TypeScript here
        	documentFormatting = false,  -- Disable formatting to avoid conflicts with other formatters
    },
})
