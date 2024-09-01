local Plugins = {
  -- Themes
  -- ==========================================================================
  { 'ellisonleao/gruvbox.nvim' },
  { 'folke/tokyonight.nvim' },
  { 'Shatur/neovim-ayu' },


  -- Editor Customizations
  -- ==========================================================================
  -- Show git statuses in the gutter.
  { 'lewis6991/gitsigns.nvim' },

  -- Add indentation guides
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

  -- Better tabs
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  -- Insert closing parens, squigglies, brackets or whatever
  { 'windwp/nvim-autopairs', event = 'InsertEnter' },


  -- Code Helpers
  -- ==========================================================================
  -- Colorizes RGB/CMYK/Hex values
  { 'norcalli/nvim-colorizer.lua' },

  -- Align all the things
  {'godlygeek/tabular'},

  -- Better syntax highlighting
  { 'nvim-treesitter/nvim-treesitter',
    dependencies = 'nvim-tree/nvim-web-devicons',
    -- config = function()
    --   require("nvim-treesitter.configs").setup({
    --     highlight = {
    --       enabled = true
    --     }
    --   })
    -- end,
  },

  -- Highlight JSX/TSX properly.
  -- TODO: Treesitter should be able to do this...
  {'MaxMEllon/vim-jsx-pretty'},

  -- Markdown shortcuts and goodness
  {'SidOfc/mkdx'},

  -- Markdown table editing
  {'dhruvasagar/vim-table-mode'},
}

return Plugins
