local api = vim.api

local function goto_tab_with_buf(bufnr)
	for _, tabnr in ipairs(api.nvim_list_tabpages()) do
		for _, win in ipairs(api.nvim_tabpage_list_wins(tabnr)) do
			if api.nvim_win_get_buf(win) == bufnr then
				api.nvim_set_current_tabpage(tabnr)
				api.nvim_set_current_win(win)
				return true
			end
		end
	end
	return false
end

local function openNewFile(filepath)
	local wins = vim.api.nvim_tabpage_list_wins(0)
	for _, win in ipairs(wins) do
		local buf = vim.api.nvim_win_get_buf(win)
		local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
		if buftype == "" then
			vim.cmd("tabnew" .. " " .. vim.fn.fnameescape(filepath))
			return
		end
	end
	vim.cmd("edit" .. " " .. vim.fn.fnameescape(filepath))
end

local function open_file_in_tab(filepath)
	local bufnr = vim.fn.bufnr(filepath, true)
	if bufnr ~= -1 then
		if goto_tab_with_buf(bufnr) then
			api.nvim_set_current_buf(bufnr)
			return
		end
	end
	openNewFile(filepath)
end

local function on_attach(bufnr)
	local nvimtree_api = require("nvim-tree.api")
	local function editFile()
		local node = nvimtree_api.tree.get_node_under_cursor()
		if node and node.type == "file" then
			open_file_in_tab(node.absolute_path)
		elseif node and node.type == "directory" then
			nvimtree_api.node.open.edit()
		end
	end
	local opts = { buffer = bufnr, noremap = true, silent = true }
	nvimtree_api.config.mappings.default_on_attach(bufnr)

	vim.keymap.set("n", "<C-t>", editFile, opts)
	vim.keymap.set("n", "<CR>", editFile, opts)
	vim.keymap.set("n", "<2-LeftMouse>", editFile, opts)
	vim.keymap.set("n", "<S-v>", function()
		nvimtree_api.node.open.vertical()
	end, opts)
	vim.keymap.set("n", "<S-h>", function()
		nvimtree_api.node.open.horizontal()
	end, opts)
end

return on_attach
