local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path
local utils=require('utils')

-- For Lua configuration (init.lua)
vim.wo.number = true  -- Enable line numbers
vim.opt.termguicolors = true
vim.opt.updatetime = 300

vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
}

vim.api.nvim_create_autocmd('BufEnter',{
	pattern='*',
callback=utils.handleEdit
})

local show_diagnostics = function()
  vim.diagnostic.open_float(nil, { focus = false })
end

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = show_diagnostics,
})

