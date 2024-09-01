local Plugins = {
  -- Themes
  -- ==========================================================================
  { 'ellisonleao/gruvbox.nvim' },
  { 'folke/tokyonight.nvim' },
  { 'Shatur/neovim-ayu' },


  -- Editor Customizations
  -- ==========================================================================
  -- Colorizes RGB/CMYK/Hex values
  { 'norcalli/nvim-colorizer.lua' },

  -- Show git statuses in the gutter.
  { 'lewis6991/gitsigns.nvim' },

  -- Add indentation guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- Better syntax highlighting
  { 'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  -- Better tabs
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  -- Insert closing parens, squigglies, brackets or whatever
  { 'windwp/nvim-autopairs', event = 'InsertEnter' },


  -- Code Helpers
  -- ==========================================================================
  -- Align all the things
  {'godlygeek/tabular'},

  -- Markdown shortcuts and goodness
  {'SidOfc/mkdx'},

  -- Markdown table editing
  {'dhruvasagar/vim-table-mode'},
}

return Plugins
