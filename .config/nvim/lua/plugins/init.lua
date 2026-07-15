-- Just having some fun <3
--
-- References:
-- https://github.com/goolord/alpha-nvim/blob/main/lua/alpha/themes/startify.lua
-- require 'alpha'.setup(require 'alpha.themes.startify'.config)
-- https://github.com/NvChad/NvChad/blob/main/lua/plugins/configs/alpha.lua
-- https://github.com/goolord/alpha-nvim/discussions/16
-- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-4803194
-- https://github.com/AllanChain/custom-chad/blob/main/plugins/alpha.lua
--
-----------------------------------------------------------------------------
local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 1,
    width = 45,
    align_shortcut = "right",
    hl = "AlphaButtons"
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, {
      noremap = true,
      silent = true
    } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts
  }
end

local function header_hl_today()
  local wday = os.date("*t").wday
  local colors = {
    "Keyword",
    "Constant",
    "Number",
    "Type",
    "String",
    "Special",
    "Function"
  }

  return colors[wday]
end

return {
  { "ellisonleao/gruvbox.nvim" },
  { "SidOfc/mkdx" },
  { "chriskempson/base16-vim" },
  { "Shatur/neovim-ayu" },
  { "echasnovski/mini.surround" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
    },
  },
  -- Editor Customizations
  -- ==========================================================================
  -- Show git statuses in the gutter.
  {
    "lewis6991/gitsigns.nvim",
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
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "│" }
    }
  },

  -- Better tabs
  { "akinsho/bufferline.nvim" },

  -- Insert closing parens, squigglies, brackets or whatever
  { "windwp/nvim-autopairs",      event = "InsertEnter" },

  -- Colorizes RGB/CMYK/Hex values
  { "norcalli/nvim-colorizer.lua" },

  -- Treesitter: better syntax highlighting, indentation, etc.
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup {
        ensure_installed = {
          "bash", "c", "css", "go", "html", "javascript", "json",
          "lua", "markdown", "markdown_inline", "python", "rust", "toml", "typescript",
          "tsx", "vim", "vimdoc", "yaml",
        },
      }
    end,
  },

  -- Nice little icons for the sidebar and tabs
  { "nvim-tree/nvim-web-devicons" },

  -- Align all the things!
  -- https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt
  { "godlygeek/tabular" },

  -- Distraction Free Editing 🧘‍♀️
  -- ==========================================================================
  -- https://github.com/folke/zen-mode.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
  { "folke/zen-mode.nvim", },

  -- Only highlight sections you're editing. Only activated in Zen Mode.
  -- https://github.com/folke/twilight.nvim?tab=readme-ov-file#-installation
  { "folke/twilight.nvim" },

  -- Markdown table editing
  { "dhruvasagar/vim-table-mode" },

  {
    "nvim-lualine/lualine.nvim",
    name = "lualine",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = {
          left = "",
          right = ""
        },
        section_separators = {
          left = "",
          right = ""
        },
        disabled_filetypes = {
          statusline = { "NvimTree" },
          winbar = {}
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000
        }
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = { "nvim-tree" }
    }
  },

  -- Splash Screen!
  {
    "goolord/alpha-nvim",
    name = "alpha",
    opts = {
      layout = { {
        type = "padding",
        val = 4
      }, {
        type = "text",
        val = { "██╗  ██╗███████╗██╗     ██╗      ██████╗     ",
          "██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ",
          "███████║█████╗  ██║     ██║     ██║   ██║    ",
          "██╔══██║██╔══╝  ██║     ██║     ██║   ██║    ",
          "██║  ██║███████╗███████╗███████╗╚██████╔╝    ",
          "╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝     ",
          "",
          "███╗   ██╗██╗██╗  ██╗██╗  ██╗██╗██╗          ",
          "████╗  ██║██║██║ ██╔╝██║  ██║██║██║          ",
          "██╔██╗ ██║██║█████╔╝ ███████║██║██║          ",
          "██║╚██╗██║██║██╔═██╗ ██╔══██║██║██║          ",
          "██║ ╚████║██║██║  ██╗██║  ██║██║███████╗██╗  ",
          "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝╚═╝" },
        opts = {
          position = "center",
          hl = header_hl_today()
        }
      }, {
        type = "padding",
        val = 2
      }, {
        type = "group",
        val = {
          button("<leader> f f", "Find File", ":Telescope find_files<CR>"),
          button("<leader> f g", "Find Word", ":Telescope live_grep<CR>"),
          -- button("<leader> f o", "Recent", ":Telescope oldfiles<CR>"),
          -- button("<leader> e s", "Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
          -- button("<leader> b m", "Bookmarks", ":Telescope marks<CR>"),
        },
        opts = {
          spacing = 0
        }
      } }
    }
  },

  -- https://github.com/nvim-tree/nvim-tree.lua
  {
    "nvim-tree/nvim-tree.lua",
    name = "nvim-tree",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      filters = {
        dotfiles = false,
        exclude = { vim.fn.stdpath "config" .. "/lua/custom" }
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      update_cwd = true,
      update_focused_file = {
        enable = true,
        update_cwd = false
      },
      view = {
        adaptive_size = true,
        side = "left"
      },
      git = {
        enable = false,
        ignore = true
      },
      filesystem_watchers = {
        enable = true
      },
      actions = {
        open_file = {
          resize_window = true
        }
      },
      renderer = {
        highlight_git = true,
        highlight_opened_files = "none",
        indent_markers = {
          enable = false
        }
      }
    }
  },

  {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    branch = "master",
    dependencies = { 'nvim-lua/plenary.nvim', {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    } },

    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = { "node_modules", ".git" },
          color_devicons = true,
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          layout_strategy = "horizontal",
          path_display = { "truncate" },
          layout_config = {
            width = 0.80,  -- Percent of viewport/width/whatever
            height = 0.95, -- Ditto but height
            preview_cutoff = 120,
            horizontal = {
              prompt_position = "top",
              results_width = 0.45, -- (1 - x)
              preview_width = 0.55  -- (x)
            },
            vertical = {
              mirror = false
            }
          }
        }
      }
      require('telescope').load_extension('fzf')
    end
  }
}
