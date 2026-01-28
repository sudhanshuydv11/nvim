local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path

require("key-mappings")
require("autocmds")
require("color-scheme")

vim.opt.autoread = true
vim.opt.wrap = false
vim.wo.number = true
vim.opt.updatetime = 300

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = true,
})

vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
