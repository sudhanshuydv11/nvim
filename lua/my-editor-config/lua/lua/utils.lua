local utils = {}

local biomeFormatter = function()
	vim.cmd("silent !biome format % --fix")
	vim.cmd("edit")
end

local luaFormatter = function()
	vim.cmd("silent !stylua %")
end
local formattersTable = {
	lua = luaFormatter,
	javascript = biomeFormatter,
	typescript = biomeFormatter,
	javascriptreact = biomeFormatter,
	typescriptreact = biomeFormatter,
	css = biomeFormatter,
	svelte= biomeFormatter
}

function utils.formatBuffer()
	local fileType = vim.bo.filetype
	if formattersTable[fileType] then
		local formatter = formattersTable[fileType]
		formatter()
	end
end

function utils.handleEdit()
	if vim.bo.buftype == "nofile" then
		vim.cmd("stopinsert")
	end
end

function utils.saveFile()
	if vim.bo.modified and vim.bo.buftype == "" then
		vim.cmd("w")
	end
end

function utils.showDiagnostics()
	vim.diagnostic.open_float(nil, { focus = false })
end

return utils
