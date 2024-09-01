local Plugins = {


  -- THEMES
  -- ═════════════════════════════════════════════════════════════════════════
  -- https://github.com/navarasu/onedark.nvim#default-configuration
  { 'navarasu/onedark.nvim' },

  -- https://github.com/ellisonleao/gruvbox.nvim#configuration
  { 'ellisonleao/gruvbox.nvim' },

  -- https://github.com/folke/tokyonight.nvim
  { 'folke/tokyonight.nvim' },

  -- https://github.com/Shatur/neovim-ayu
  { 'Shatur/neovim-ayu' },


  -- EDITOR CUSTOMIZATIONS
  -- ═════════════════════════════════════════════════════════════════════════
  -- Git integration
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add          = { text = '+' },
        change       = { text = '~' },
        delete       = { text = 'x' },
        topdelete    = { text = '^' },
        changedelete = { text = '~' },
        untracked    = { text = '?' },
      }
    }
  },

  -- Better icons in the sidebar
  { 'nvim-tree/nvim-web-devicons' },

  -- -- Fuzzy finder!
  -- {
  --   'nvim-telescope/telescope.nvim',
  --   tag = '0.1.8',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim'
  --   },
  -- },
  -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

  -- Show indentation guides
  -- Configuration
  -- https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/lua/ibl/config.lua
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "┊",
      }
    },
  },

  -- Better-looking and working tabs
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
      options = {
        mode = "tabs",
        indicator = {
          style = "icon"
        },
        color_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "slant",
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
        always_show_bufferline = false,
        auto_toggle_bufferline = true
      }
    }
  },


  -- PROGRAMMING AND EDITING-RELATED STUFF
  -- ═════════════════════════════════════════════════════════════════════════
  -- Colorizes RGB/CMYK/Hex values
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  },

  -- Better Syntax Highlighting
  {
    'nvim-treesitter/nvim-treesitter',
    opts = {
      ensure_installed = {
        "bash",
        "css",
        "go",
        "javascript",
        "tsx",
        "typescript",
        "python",
        "lua",
        "scss",
      },
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      },
    }
  },

  -- Insert closing bracket or paren or squiggle or whatever
  { 'windwp/nvim-autopairs', event = 'InsertEnter' },

  -- Align stuff
  {'godlygeek/tabular'},

  -- Markdown Shortcuts
  {'SidOfc/mkdx'},

  -- Table Support for Markdown
  {'dhruvasagar/vim-table-mode'},
}

return Plugins
