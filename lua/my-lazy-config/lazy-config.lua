vim.opt.runtimepath:append("~/.local/share/nvim/lazy/lazy.nvim")

local config_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)")
package.path = config_path .. "lua/?.lua;" .. package.path
require('lazy').setup({
	'nvim-tree/nvim-tree.lua',
	"neovim/nvim-lspconfig" ,  -- LSP configuration	
	"mason-org/mason.nvim",
    	{
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
},
	'nanozuki/tabby.nvim',
	'nvim-tree/nvim-web-devicons',
	'tpope/vim-fugitive',
	{
        'tanvirtin/vgit.nvim',  -- Git integration for Neovim
        dependencies = { 'nvim-lua/plenary.nvim' },  -- Required dependency
        config = function()
            require('vgit').setup()  -- Optional: Add any specific configuration here
        end,
    	},
	    {
        'lewis6991/gitsigns.nvim',  -- Git signs in the gutter
        config = function()
            require('gitsigns').setup()
        end,
    	},
    	{
        'f-person/git-blame.nvim',  -- Git blame information
        config = function()
			vim.g.gitblame_enabled = 1  -- Enable git blame by default
        end,
    	},
	    {
        'nvim-treesitter/nvim-treesitter',  -- Tree-sitter support
        build = ':TSUpdate',  -- Automatically update parsers
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { 
                    "javascript", 
                    "typescript", 
                    "json", 
                    "tsx",  
                    "lua",
		    "java"
                },  -- Install all parsers
                highlight = {
                    enable = true,  -- Enable syntax highlighting
                },
                indent = {
                    enable = true,  -- Enable indentation
                },
            }
        end,
    },
	{
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken",
		    opts = {
      auto_insert_mode= true,
	chat_autocomplete=true,
	insert_at_end=true
    },
  },
	{
  	"hrsh7th/nvim-cmp",
  	version = false, -- last release is way too old
  	event = "InsertEnter",
  	dependencies = {
    	"hrsh7th/cmp-nvim-lsp",
    	"hrsh7th/cmp-buffer",
    	"hrsh7th/cmp-path",
  	}
  },
	{ 'stevearc/dressing.nvim', event = 'VeryLazy' },
 {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
	{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true}
})


require('plugins-config')
require('my-lsp-config.lsp-config')
require('my-mason-config.mason-config')

