local Plugins = {
  -- Themes
  -- ==========================================================================
  { "ellisonleao/gruvbox.nvim" },
  { "Shatur/neovim-ayu" },
  { "folke/tokyonight.nvim",
    opts = {
      lazy = true,
      style = "moon"
    },
  },


  -- Editor Customizations
  -- ==========================================================================
  -- Show git statuses in the gutter.
  { "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "✘" },
        topdelete    = { text = "^" },
        changedelete = { text = "~" },
        untracked    = { text = "?" },
      }
    }
  },

  -- Add indentation guides
  { "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" }
    }
  },

  -- Better tabs
  {
    "akinsho/bufferline.nvim",
    dependencies = "nvim-tree/nvim-web-devicons"
  },

  -- Insert closing parens, squigglies, brackets or whatever
  { "windwp/nvim-autopairs", event = "InsertEnter" },


  -- Code Helpers
  -- ==========================================================================
  -- Colorizes RGB/CMYK/Hex values
  { "norcalli/nvim-colorizer.lua" },

  -- Align all the things!
  -- https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt
  {"godlygeek/tabular"},

  -- Better syntax highlighting
  -- https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#table-of-contents
  { "nvim-treesitter/nvim-treesitter",
    dependencies = "nvim-tree/nvim-web-devicons",
  },

  -- Highlight JSX/TSX properly.
  -- TODO: Treesitter should be able to do this...
  { "MaxMEllon/vim-jsx-pretty" },

  -- Markdown shortcuts and goodness
  { "SidOfc/mkdx" },

  -- Markdown table editing
  { "dhruvasagar/vim-table-mode" },
}

return Plugins
