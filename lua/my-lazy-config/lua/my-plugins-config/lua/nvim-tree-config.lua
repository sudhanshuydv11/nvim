vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_buf_set_option(0, "buftype", "nofile")
local function dofile_relative(relpath)
	local info = debug.getinfo(2, "S")
	local src = info.source:sub(2)
	local dir = src:match("(.*/)")
	return dofile(dir .. relpath)
end
local on_attach = dofile_relative("utils.lua")

require("nvim-tree").setup({
	on_attach = on_attach, -- Attach custom key mappings
	tab = {
		sync = {
			open = true,
		},
	},
	git = {
		enable = true,
		ignore = false, -- Show ignored files
	},
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true, -- update the focused file in the tree on BufEnter
		update_cwd = true, -- update the root directory of the tree on BufEnter
	},
	renderer = {
		highlight_git = "name",
		highlight_modified = "icon",
		indent_markers = {
			enable = true,
			inline_arrows = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = " ",
			},
		},
		icons = {
			glyphs = {
				default = "",
				symlink = "",
			},
		},
	},
	view = {
		width = 20, -- Width of the tree
		side = "right", -- Position of the tree
		preserve_window_proportions = true,
	},
	--
	actions = {
		open_file = {
			resize_window = false,
			window_picker = {
				enable = false,
			},
		},
	},
})
