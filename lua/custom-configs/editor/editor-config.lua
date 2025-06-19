local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path
local utils=require('utils')

vim.o.wrap = false
vim.o.sidescroll = 1
vim.o.sidescrolloff = 1

vim.wo.number = true  -- Enable line numbers
vim.opt.termguicolors = true -- Enable 24-bit RGB colors in the terminal
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

