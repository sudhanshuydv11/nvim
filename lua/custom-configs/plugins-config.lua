vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_buf_set_option(0, 'buftype', 'nofile')

require'nvim-web-devicons'.setup {
  default = true; -- Enable default icons
}

require('nvim-tree').setup({
    -- Your Nvim Tree configuration options
    git = {
        enable = true,
    },
    renderer = {
    icons = {
      glyphs = {
        default = '',
        symlink = '',
        git = {
          unstaged = "✗",
          staged = "✓",
          untracked = "★",
        },
      },
    },
  },
    view = {
        width = 30,  -- Width of the tree
        side = 'left',  -- Position of the tree
    },
})
