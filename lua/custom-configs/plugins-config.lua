vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_buf_set_option(0, 'buftype', 'nofile')

require'nvim-web-devicons'.setup {
  default = true; -- Enable default icons
}

require('nvim-tree').setup({
git = {
        enable = true,
    },
    renderer = {
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = "US",
          staged = "S",
          untracked = "UT",
        },
      },
    },
  },
filters = {
    dotfiles = true,
  },
    view = {
        width = 30,  -- Width of the tree
        side = 'right',  -- Position of the tree

      preserve_window_proportions = true,
      ---
    },
    --
    actions = {
      --
      open_file = {
        resize_window = false,
        --
      },
      --
    }
})

require('cmp').setup({
   mapping = require('cmp').mapping.preset.insert({
    ['<Down>'] = require('cmp').mapping.select_next_item({ behavior = require('cmp').SelectBehavior.Select }),
    ['<Up>'] = require('cmp').mapping.select_prev_item({ behavior = require('cmp').SelectBehavior.Select }),
    ['<CR>'] = require('cmp').mapping.confirm({ select = true }),
  }),
  -- Enable sources for completion
  sources = {
    { name = 'copilot' },         -- GitHub Copilot
    { name = 'nvim_lsp' },        -- LSP (Language Server Protocol)
    { name = 'buffer' },          -- Completion from current buffer
    { name = 'path' },            -- File path completion
  },
})

require("CopilotChat").setup({
  mappings = {
    complete = false, -- disables the <Tab> mapping for completion
  }
})

