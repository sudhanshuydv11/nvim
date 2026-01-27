local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path
require("nvim-tree-config")

require("nvim-web-devicons").setup({
	default = true, -- Enable default icons
})

require("cmp").setup({
	mapping = require("cmp").mapping.preset.insert({
		["<Down>"] = require("cmp").mapping.select_next_item({ behavior = require("cmp").SelectBehavior.Select }),
		["<Up>"] = require("cmp").mapping.select_prev_item({ behavior = require("cmp").SelectBehavior.Select }),
		["<CR>"] = require("cmp").mapping.confirm({ select = true }),
	}),
	-- Enable sources for completion
	sources = {
		{ name = "copilot" }, -- Copilot completion
		{ name = "nvim_lsp" }, -- LSP (Language Server Protocol)
		{ name = "buffer" }, -- Completion from current buffer
		{ name = "path" }, -- File path completion
	},
})

require("CopilotChat").setup({
	window = {
		position = "vertical right", -- Position of the chat window
		width = 30, -- Height of the chat window
	},
	mappings = {
		complete = false, -- disables the <Tab> mapping for completion
	},
	chat_autocomplete = true,
	auto_insert_mode = true,
	insert_at_end = true,
})
require("vgit").setup()
require("gitsigns").setup()
require("gitblame").setup()
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"javascript",
		"typescript",
		"json",
		"tsx",
		"lua",
		"java",
	}, -- Install all parsers
	highlight = {
		enable = true, -- Enable syntax highlighting
	},
	indent = {
		enable = true, -- Enable indentation
	},
})

require("fzf-lua").setup({})

local buf_name = require('tabby.feature.buf_name')
local devicons = require('nvim-web-devicons')

require('tabby.tabline').use_preset('active_wins_at_tail', {
  nerdfont = true,
  theme = {
    fill = { fg = '#ebdbb2', bg = '#282828' },
    head = { fg = '#b8bb26', bg = '#282828', style = 'bold' },
    current_tab = { fg = '#282828', bg = '#98971a', style = 'bold' }, -- greenish
    tab = { fg = '#ebdbb2', bg = '#3c3836' },
    win = { fg = '#b8bb26', bg = '#3c3836' },
    tail = { fg = '#b8bb26', bg = '#282828', style = 'bold' },
  },
  tab_name = {
    name_fallback = function(tabid)
      local wins = vim.api.nvim_tabpage_list_wins(tabid)
      for i = #wins, 1, -1 do
        local win = wins[i]
        if vim.api.nvim_win_is_valid(win) then
          local buf = vim.api.nvim_win_get_buf(win)
          if vim.api.nvim_buf_is_valid(buf)
            and vim.bo[buf].buftype == ''
            and vim.bo[buf].modifiable
          then
            local icon = devicons.get_icon(vim.api.nvim_buf_get_name(buf)) or '' -- remove default glyph
            local name = buf_name.get(win, { mode = 'tail' })
            local mod = vim.bo[buf].modified and ' ●' or ''
            return ' ' .. icon .. ' ' .. name .. mod .. ' '
          end
        end
      end
      return ' [No File] '
    end,
    padding = { left = 1, right = 1 },
  },
})


