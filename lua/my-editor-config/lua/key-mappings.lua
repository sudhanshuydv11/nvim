local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path

local utils = require("utils")

vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<C-x>", '"+d', { noremap = true, silent = true })

vim.keymap.set({ "n", "v", "i", "t", "c" }, "<C-v>", function()
	vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
end, { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<C-s>", utils.saveFile, { noremap = true, silent = true })
vim.keymap.set("i", "<C-s>", utils.saveFile, { noremap = true, silent = true })

vim.keymap.set("n", "<S-Tab>", function()
	vim.cmd("tabn")
end, { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<C-z>", "u", { noremap = true })
vim.keymap.set({ "i" }, "<C-z>", "<C-o>u", { noremap = true })
vim.keymap.set("i", "<C-y>", "<C-o><C-r>", { noremap = true })
vim.keymap.set("i", "<C-w>w", function()
	vim.cmd("bnext")
end, { noremap = true })
vim.keymap.set("n", "<S-h>", function()
	local nvimApi = require("nvim-tree.api")
	nvimApi.node.open.vertical()
end, { noremap = true, silent = true, nowait = true }) -- use on attch of nvim tree config if you ever move it

vim.keymap.set({ "n", "v", "t" }, "<C-q>", function()
	vim.cmd("q")
end, { noremap = true, silent = true })

vim.keymap.set("i", "<C-q>", function()
	vim.cmd("stopinsert")
	vim.cmd("q")
end, { noremap = true, silent = true })

vim.keymap.set({ "v", "n", "t" }, "<C-a>", "ggVG", { noremap = true, silent = true })
vim.keymap.set("v", "<BS>", '"_d', { noremap = true, silent = true })
vim.keymap.set("i", "<C-a>", "<Esc>ggVG", { noremap = true, silent = true })

local fzf = require("fzf-lua")
vim.keymap.set("n", "<SPACE>ff", fzf.files, { desc = "FzfLua find files" })
vim.keymap.set("n", "<SPACE>fg", fzf.live_grep, { desc = "FzfLua grep (project search)" })
vim.keymap.set("n", "<SPACE>fb", fzf.buffers, { desc = "FzfLua buffers" })
vim.keymap.set("n", "<SPACE>fh", fzf.help_tags, { desc = "FzfLua help tags" })
vim.keymap.set({ "n", "c", "i" }, "<C-f>", fzf.lgrep_curbuf, { desc = "FzfLua fuzzy lines in current buffer" })

vim.api.nvim_create_user_command("T", function()
	vim.cmd("botright split | terminal")
end, {})
vim.cmd("cnoreabbrev t T")

vim.api.nvim_create_user_command("C", function()
	vim.cmd("CopilotChatClose")
	vim.cmd("CopilotChat")
end, {})
vim.cmd("cnoreabbrev c C")
