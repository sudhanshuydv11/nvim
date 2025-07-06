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

local function open_file_in_tab(filepath, editPlace)
	local bufnr = vim.fn.bufnr(filepath, true)
	if bufnr ~= -1 then
		if goto_tab_with_buf(bufnr) then
			api.nvim_set_current_buf(bufnr)
			return
		end
	end
	vim.cmd( editPlace .. " " .. vim.fn.fnameescape(filepath))
end

local function on_attach(bufnr)
	local nvimtree_api = require("nvim-tree.api")
	local function open_file(editPlace)
		local node = nvimtree_api.tree.get_node_under_cursor()
		if node and node.type == "file" then
			open_file_in_tab(node.absolute_path,editPlace)
		elseif node and node.type == "directory" then
			nvimtree_api.node.open.edit()

		end
	end
	local opts = { buffer = bufnr, noremap = true, silent = true }
	 nvimtree_api.config.mappings.default_on_attach(bufnr)
	local newTabEdit=function ()
		open_file("tabnew")
	end

	vim.keymap.set("n", "<C-t>", newTabEdit, opts)
	vim.keymap.set("n", "<CR>", newTabEdit, opts)
	vim.keymap.set("n", "<2-LeftMouse>", newTabEdit, opts)
end

return on_attach
