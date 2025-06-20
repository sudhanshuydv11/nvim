local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path

require('color-scheme')
require('key-mappings')

local utils=require('utils')

vim.opt.autoread = true

vim.wo.number = true
vim.opt.termguicolors = true
vim.opt.updatetime = 300

vim.diagnostic.config({
virtual_text =false,
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

vim.opt.clipboard = 'unnamedplus'
vim.api.nvim_create_autocmd({'BufEnter'},
	{
	pattern='*',
callback=function()
		utils.handleEdit()
	end
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
   callback = utils.showDiagnostics,
})

vim.api.nvim_create_autocmd({'BufLeave'},
	{
	pattern='*',
callback=function()
		utils.saveFile()
	end
})

