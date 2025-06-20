require("lazy").setup({
	"nvim-tree/nvim-tree.lua",
	"neovim/nvim-lspconfig", -- LSP configuration
	"mason-org/mason.nvim",
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	"nanozuki/tabby.nvim",
	"nvim-tree/nvim-web-devicons",
	"tpope/vim-fugitive",
	{
		"tanvirtin/vgit.nvim", -- Git integration for Neovim
		dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
	},
	{
		"lewis6991/gitsigns.nvim"
	},
		"f-person/git-blame.nvim",
	{
		"nvim-treesitter/nvim-treesitter", -- Tree-sitter support
		build = ":TSUpdate"
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken"
	},
	{
		"hrsh7th/nvim-cmp",
		version = false, -- last release is way too old
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
})

