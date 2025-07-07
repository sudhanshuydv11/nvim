local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path

local utils = require("utils")

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "*",
	callback = function()
		utils.handleEdit()
	end,
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	pattern = "*",
	callback = utils.showDiagnostics,
})

vim.api.nvim_create_autocmd({ "BufLeave" }, {
	pattern = "*",
	callback = function()
		utils.saveFile()
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = "*",
	callback = function()
		utils.formatBuffer()
	end,
})
