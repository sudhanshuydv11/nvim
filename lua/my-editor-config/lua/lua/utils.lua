local utils = {}

local formattersTable = {
	lua = "stylua",
}

local function formatBuffer()
	local fileType = vim.bo.filetype

	vim.cmd("w")

	if formattersTable[fileType] then
		local formatter = formattersTable[fileType]
		vim.cmd("silent !" .. formatter .. " %")
	end
end

function utils.handleEdit()
	if vim.bo.buftype == "nofile" then
		vim.cmd("stopinsert")
	else
		vim.cmd("startinsert")
	end
end

function utils.saveFile()
	if vim.bo.modified and vim.bo.buftype == "" then
		formatBuffer()
	end
end

function utils.showDiagnostics()
	vim.diagnostic.open_float(nil, { focus = false })
end

return utils
