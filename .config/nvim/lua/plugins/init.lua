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
    config = function()
      require("nvim-treesitter.configs").setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be
        -- installed)
        ensure_installed = {
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",

          -- These are from `init.lua` two levels above
          "bash",
          "css",
          "javascript",
          "lua",
          "yaml",
          "python",
          "scss",
          "sql",
          "typescript",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        auto_install = true,

        highlight = {
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the
          -- same time. Set this to `true` if you depend on 'syntax' being
          -- enabled (like for indentation). Using this option may slow down
          -- your editor, and you may see some duplicate highlights. Instead of
          -- true it can also be a list of languages
          additional_vim_regex_highlighting = false
        },
      }
    end
  },

  -- Distraction Free Editing 🧘‍♀️
  -- ==========================================================================
  {
    -- https://github.com/folke/zen-mode.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    "folke/zen-mode.nvim",
  },
  {
    -- https://github.com/folke/twilight.nvim?tab=readme-ov-file#-installation
    "folke/twilight.nvim",
  },

  -- Highlight JSX/TSX properly.
  -- TODO: Treesitter should be able to do this...
  { "MaxMEllon/vim-jsx-pretty" },

  -- Markdown shortcuts and goodness
  { "SidOfc/mkdx" },

  -- Markdown table editing
  { "dhruvasagar/vim-table-mode" },

  -- Markdown rendering
  -- { "MeanderingProgrammer/render-markdown.nvim",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     "nvim-tree/nvim-web-devicons"
  --   },
  --   config = function()
  --     require("render-markdown").setup({
  --       pipe_table = { preset = "round" },
  --       heading = {
  --         sign = false,
  --       },
  --       code = {
  --         sign = false,
  --         position = "left",
  --       },
  --       checkbox = {
  --         unchecked = {
  --           icon = "✘ "
  --         },
  --         checked = {
  --           icon = "✔ "
  --         },
  --         custom = {
  --           todo = {
  --             rendered = "◯ "
  --           }
  --         },
  --       },
  --     })
  --   end
  -- }
}

return Plugins
