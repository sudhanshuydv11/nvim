vim.keymap.set({'n', 'v'}, '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-v>', '"+p', { noremap = true, silent = true })
vim.keymap.set({'n', 'v'}, '<C-x>', '"+d', { noremap = true, silent = true })

vim.keymap.set("n", "<C-c>", ":CopilotChat<CR>", { desc = "Open Copilot Chat" })

vim.keymap.set({"n", "v"}, "<C-s>", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", "<C-o>:w<CR>", { noremap = true, silent = true })

vim.keymap.set("i", '<C-z>', '<C-o>u', { noremap = true })
vim.keymap.set("i", '<C-y>', '<C-o><C-r>', { noremap = true })
