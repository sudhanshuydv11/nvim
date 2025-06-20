vim.keymap.set('v', '<C-c>','"+y', { noremap = true, silent = true })
vim.keymap.set('v', '<C-x>','"+d', { noremap = true, silent = true })

vim.keymap.set({'n','v','i'}, '<C-v>',function ()
	vim.api.nvim_paste(vim.fn.getreg('+'), true, -1)
end, { noremap = true, silent = true })

vim.keymap.set({"n", "v"}, "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<C-o>:w<CR>", { noremap = true, silent = true })

vim.keymap.set("i", '<C-z>', '<C-o>u', { noremap = true })
vim.keymap.set("i", '<C-y>', '<C-o><C-r>', { noremap = true })

vim.keymap.set("n", "<S-Tab>",'',{ noremap = true, silent = true, nowait = true, callback =function()
local nvimApi = require('nvim-tree.api')
nvimApi.node.open.vertical()
end}) -- use on attch of nvim tree config if you ever move it

vim.keymap.set({'n','v','t'}, '<C-q>', [[<C-\><C-n>:bd!<CR>]], { noremap = true, silent = true })

vim.keymap.set('i', '<C-q>', function()
  vim.cmd('stopinsert')
  vim.cmd('q')
end, { noremap = true, silent = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<SPACE>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<SPACE>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<SPACE>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<SPACE>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set({"n","c","i"}, '<C-f>', builtin.current_buffer_fuzzy_find, { desc = 'Telescope help tags' })




vim.api.nvim_create_user_command('T', function()

  vim.cmd('botright split | terminal')

end,  {})
vim.cmd('cnoreabbrev t T')

vim.api.nvim_create_user_command('C',
	 function()
vim.cmd("CopilotChatClose")
  vim.cmd("CopilotChat")
	end, {})
vim.cmd('cnoreabbrev c C')


