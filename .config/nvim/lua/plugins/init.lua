local Plugins = {
  -- Themes
  -----------------------------------------------------------------------------
  { 'folke/tokyonight.nvim' },
  { 'navarasu/onedark.nvim' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'Shatur/neovim-ayu' },

  -- Editor Customizations
  -----------------------------------------------------------------------------
  { 'norcalli/nvim-colorizer.lua' }, -- Colorizes RGB/CMYK/Hex values
  { 'nvim-tree/nvim-tree.lua' },     -- Explorer/File Tree Stuff
  { 'nvim-tree/nvim-web-devicons' }, -- Show better filetype icons in the tree!
  {
    'nvim-telescope/telescope.nvim', -- Fuzzy finder!
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'lukas-reineke/indent-blankline.nvim' }, -- Adds indent guides in the current file
  { 'lewis6991/gitsigns.nvim' },             -- Git integration
  { 'nvim-treesitter/nvim-treesitter' },     -- Syntax Highlighting
  { 'nvim-lualine/lualine.nvim' },           -- Status bar
  { 'goolord/alpha-nvim' },                  -- Splashscreen
  {
    'akinsho/bufferline.nvim',               -- Tabs
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  { 'windwp/nvim-autopairs' },

  -- LSP support
  -----------------------------------------------------------------------------
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Autocomplete (no snippets... yet!)
  -----------------------------------------------------------------------------
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-nvim-lsp' },

  -- Snippets
  -----------------------------------------------------------------------------
  {
    'L3MON4D3/LuaSnip',
    version = "<CurrentMajor>.*",
    build = "make install_jsregexp"
  },
  {'rafamadriz/friendly-snippets'},

  -- Utilities
  -----------------------------------------------------------------------------
  {'godlygeek/tabular'},
  {'SidOfc/mkdx'},
  {'dhruvasagar/vim-table-mode'},
}

return Plugins
