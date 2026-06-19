local Plugins = {
  -- Themes
  -- ==========================================================================
  { "ellisonleao/gruvbox.nvim" },
  { "chriskempson/base16-vim" },
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
    "akinsho/bufferline.nvim"
  },


  -- Insert closing parens, squigglies, brackets or whatever
  { "windwp/nvim-autopairs", event = "InsertEnter" },

  -- Nice little icons for the sidebar and tabs
  {"nvim-tree/nvim-web-devicons"},

  -- Code Helpers
  -- ==========================================================================
  -- Colorizes RGB/CMYK/Hex values
  { "norcalli/nvim-colorizer.lua" },

  -- Align all the things!
  -- https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt
  {"godlygeek/tabular"},

  -- Better syntax highlighting
  -- On the `main` branch, nvim-treesitter only handles parser installation.
  -- Highlighting is built into Neovim 0.12+ via vim.treesitter.
  { "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    opts = {
      ensure_installed = {
        "vim", "vimdoc", "query",
        "bash", "css", "javascript", "lua",
        "yaml", "python", "scss", "sql", "typescript",
      },
      auto_install = true,
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)

      -- Disable treesitter highlighting for markdown (crashes on 0.12.3)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "markdown" },
        callback = function(args)
          vim.treesitter.stop(args.buf)
        end,
      })
    end,
  },

  -- Distraction Free Editing 🧘‍♀️
  -- ==========================================================================
  {
    -- https://github.com/folke/zen-mode.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    "folke/zen-mode.nvim",
  },
  {
    -- Only highlight sections you're editing. Only activated in Zen Mode.
    -- https://github.com/folke/twilight.nvim?tab=readme-ov-file#-installation
    "folke/twilight.nvim",
  },

  -- Other nice-to-haves
  -- ==========================================================================

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
