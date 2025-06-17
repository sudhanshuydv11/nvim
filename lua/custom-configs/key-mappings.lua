vim.keymap.set({'n','v'}, '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('v', '<C-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set('v', '<C-x>', '"+d', { noremap = true, silent = true })

vim.keymap.set("n", "<C-c>", function()
  vim.cmd("CopilotChatClose")
  vim.cmd("CopilotChat")
end, { desc = "Toggle Copilot Chat" })


vim.keymap.set({"n", "v"}, "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<C-o>:w<CR>", { noremap = true, silent = true })

vim.keymap.set("i", '<C-z>', '<C-o>u', { noremap = true })
vim.keymap.set("i", '<C-y>', '<C-o><C-r>', { noremap = true })

vim.keymap.set("n", "<S-Tab>",'',{ noremap = true, silent = true, nowait = true, callback =function()
local nvimApi = require('nvim-tree.api')
nvimApi.node.open.vertical()
end}) -- use on attch of nvim tree config if you ever move it
