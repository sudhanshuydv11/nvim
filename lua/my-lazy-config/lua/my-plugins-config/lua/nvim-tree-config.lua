vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.api.nvim_buf_set_option(0, "buftype", "nofile")

require("nvim-tree").setup({
	tab = {
		sync = {
			open = true,
		},
	},
	git = {
		enable = true,
	},
	diagnostics = {
		enable = true,
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
