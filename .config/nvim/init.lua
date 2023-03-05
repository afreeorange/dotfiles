-- =========== OPTIONS ========== --

-- Enable line numbers
vim.opt.number = true

-- Ignore case during a search
vim.opt.ignorecase = true

-- Now ignore case unless a search term has an uppercase char!
vim.opt.smartcase = true

-- Highlight search results
vim.opt.hlsearch = true

-- Indentation behaviour
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Highlight the line I'm on
vim.opt.cursorline = false

-- Show a ruler at various widths
vim.opt.colorcolumn = { 79, 100, 120 }

-- If the terminal supports it, enable mouse support in all ("a") modes
vim.opt.mouse = 'a'

-- Save undo history
vim.opt.undofile = true

-- vim.opt.list = true
-- vim.opt.listchars:append "eol:↴"
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- Keep signcolumn on by default. I with with files that are in git repos 90%+ of the time
vim.opt.signcolumn = 'yes'

-- Some pre-configuration for theming
vim.opt.termguicolors = true
vim.opt.background = "dark" -- or "light" for light mode











-- =========== COMMANDS ========== --

-- Autoreload $MYVIMRC on save
-- https://superuser.com/a/1120318
vim.cmd [[
if has ('autocmd')
    augroup vimrc
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    augroup END
endif
]]










-- =========== KEY-MAPPINGS ========== --

vim.keymap.set("n", "<leader>ev", "<cmd>vsplit $MYVIMRC<cr>", { noremap = true, silent = true })

-- Tab movement
vim.keymap.set("n", "<C-n>", "<cmd>tabnew<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-[>", "<cmd>tabprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-]>", "<cmd>tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-t>", "<cmd>tabclose<CR>", { noremap = true, silent = true })

if jit.os == "OSX" then
  vim.keymap.set("n", "Ω", "<cmd>set wrap!<cr>", { noremap = true, silent = true })
  vim.keymap.set("n", "¬", "<cmd>set nonumber!<cr>", { noremap = true, silent = true })
end









-- =========== PLUGIN SETUP ========== --

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  -- Themes
  -----------------------------------------------------------------------------
  { 'folke/tokyonight.nvim' },
  { 'navarasu/onedark.nvim' }, -- https://github.com/navarasu/onedark.nvim#default-configuration
  { 'ellisonleao/gruvbox.nvim' },

  -- Colorizes RGB/CMYK/Hex values
  -----------------------------------------------------------------------------
  -- https://github.com/norcalli/nvim-colorizer.lua
  { 'norcalli/nvim-colorizer.lua' },

  { 'nvim-tree/nvim-tree.lua' },
  { 'nvim-tree/nvim-web-devicons' },

  -- Fuzzy finder
  -----------------------------------------------------------------------------
  -- https://github.com/nvim-telescope/telescope.nvim#default-mappings
  -- Lots of extensions!
  -- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },


  -- Syntax Highlighting
  -----------------------------------------------------------------------------
  { 'nvim-treesitter/nvim-treesitter' },

  -- Adds indent guides in the current file
  -----------------------------------------------------------------------------
  { 'lukas-reineke/indent-blankline.nvim' },

  -- Git integration
  -----------------------------------------------------------------------------
  -- https://github.com/lewis6991/gitsigns.nvim#usage
  { 'lewis6991/gitsigns.nvim' },
  { 'tpope/vim-fugitive' },

  -- Bottom Line
  -----------------------------------------------------------------------------
  -- https://github.com/nvim-lualine/lualine.nvim#default-configuration
  { 'nvim-lualine/lualine.nvim' },

  { 'windwp/nvim-autopairs' },

  -- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt
  {
    'akinsho/bufferline.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons'
  },

  -- The default. Rather nice.
  -- https://github.com/goolord/alpha-nvim/blob/main/lua/alpha/themes/startify.lua
  -- require 'alpha'.setup(require 'alpha.themes.startify'.config)
  -- https://github.com/NvChad/NvChad/blob/main/lua/plugins/configs/alpha.lua
  -- https://github.com/goolord/alpha-nvim/discussions/16
  -- https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-4803194
  -- https://github.com/AllanChain/custom-chad/blob/main/plugins/alpha.lua
  { 'goolord/alpha-nvim' },


  -- LSP support
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },

  -- Autocomplete
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'hrsh7th/cmp-nvim-lsp' },

  -- Snippets
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },
})








-- =========== PLUGIN CONFIGURATION ========== --

require('onedark').setup({
  style = 'darker',
})
require('onedark').load()

-- { 'norcalli/nvim-colorizer.lua' },
require('colorizer').setup()

-- { 'nvim-tree/nvim-tree.lua' },
require("nvim-tree").setup({
  filters = {
    dotfiles = false,
    exclude = { vim.fn.stdpath "config" .. "/lua/custom" },
  },
  disable_netrw = true,
  hijack_netrw = true,
  hijack_cursor = true,
  hijack_unnamed_buffer_when_opening = false,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = false,
  },
  view = {
    adaptive_size = true,
    side = "left",
    width = 25,
    hide_root_folder = true,
  },
  git = {
    enable = false,
    ignore = true,
  },
  filesystem_watchers = {
    enable = true,
  },
  actions = {
    open_file = {
      resize_window = true,
    },
  },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "none",
    indent_markers = {
      enable = false,
    },
  },
})
vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })

-- { 'nvim-tree/nvim-web-devicons' },
require("nvim-web-devicons").setup()

-- { 'nvim-lualine/lualine.nvim' },
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'NvimTree' },
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = { "nvim-tree" }
}

-- { 'nvim-treesitter/nvim-treesitter' },
require("nvim-treesitter.configs").setup {
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

-- { 'lukas-reineke/indent-blankline.nvim' },
require("indent_blankline").setup {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}

-- { 'lewis6991/gitsigns.nvim' },
require('gitsigns').setup({
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = 'x' },
    topdelete    = { text = '^' },
    changedelete = { text = '~' },
    untracked    = { text = '?' },
  }
})

-- { 'windwp/nvim-autopairs' },
require("nvim-autopairs").setup()

-- { 'nvim-telescope/telescope.nvim' },
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
-- require('telescope').load_extension('fzf')
require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "node_modules" },
    color_devicons = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    layout_strategy = "horizontal",
    path_display = { "truncate" },
    layout_config = {
      width = 0.80,  -- Percent of viewport/width/whatever
      height = 0.95, -- Ditto but height
      preview_cutoff = 120,
      horizontal = {
        prompt_position = "top",
        results_width = 0.45, -- (1 - x)
        preview_width = 0.55, -- (x)
      },
      vertical = {
        mirror = false,
      },
    },
  }
})

-- { 'akinsho/bufferline.nvim' },
require("bufferline").setup({
  options = {
    mode = 'buffers',
    offsets = {
      { filetype = 'NvimTree' }
    },
  },
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = { attribute = 'fg', highlight = 'Function' },
      italic = false
    }
  }
})


require('indent_blankline').setup({
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = false
})


local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 1,
    width = 45,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

local function header_hl_today()
  local wday = os.date("*t").wday
  local colors = { "Keyword", "Constant", "Number", "Type", "String", "Special", "Function" }
  return colors[wday]
end
require("alpha").setup({
  layout = {
    { type = "padding", val = 4 },
    {
      type = "text",
      val = {
        "██╗  ██╗███████╗██╗     ██╗      ██████╗     ",
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
        "╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝╚══════╝╚═╝",
      },
      opts = {
        position = "center",
        hl = header_hl_today(),
      },
    },
    { type = "padding", val = 5 },
    {
      type = "group",
      val = {
        button("<leader> f o", "Recent", ":Telescope oldfiles<CR>"),
        button("<leader> f f", "Find File", ":Telescope find_files<CR>"),
        button("<leader> f w", "Find Word", ":Telescope live_grep<CR>"),
        button("<leader> b m", "Bookmarks", ":Telescope marks<CR>"),
        button("<leader> e s", "Settings", ":e $MYVIMRC | :cd %:p:h <CR>"),
      },
      opts = {
        spacing = 0,
      },
    }
  },
})

-- MASON STUFF
require('mason').setup({
  ui = { border = 'rounded' }
})
require('mason-lspconfig').setup({
  ensure_installed = {
    'tsserver',
    'eslint',
    'html',
    'cssls'
  }
})


---
-- nvim-cmp (autocomplete)
---
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = { behavior = cmp.SelectBehavior.Select }

-- See :help cmp-config
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 1 },
    { name = 'buffer',   keyword_length = 3 },
    { name = 'luasnip',  keyword_length = 2 },
  },
  window = {
    documentation = cmp.config.window.bordered()
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  -- See :help cmp-mapping
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<C-f>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1

      if cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
})

---
-- LSP config
---
-- See :help lspconfig-global-defaults
local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

---
-- Diagnostic customization
---
local sign = function(opts)
  -- See :help sign_define()
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

sign({ name = 'DiagnosticSignError', text = '✘' })
sign({ name = 'DiagnosticSignWarn', text = '▲' })
sign({ name = 'DiagnosticSignHint', text = '⚑' })
sign({ name = 'DiagnosticSignInfo', text = '' })

-- See :help vim.diagnostic.config()
vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  float = {
    border = 'rounded',
    source = 'always',
  },
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'rounded' }
)

---
-- LSP Keybindings
---
vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = true }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- You can search each function in the help page.
    -- For example :help vim.lsp.buf.hover()

    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
    bufmap('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})


---
-- LSP servers
---
-- See :help mason-lspconfig-dynamic-server-setup
require('mason-lspconfig').setup_handlers({
  function(server)
    -- See :help lspconfig-setup
    lspconfig[server].setup({})
  end,
  ['tsserver'] = function()
    lspconfig.tsserver.setup({
      settings = {
        completions = {
          completeFunctionCalls = true
        }
      }
    })
  end
})


-- To Check out

-- https://github.com/moll/vim-bbye


-- =========== REFERENCES ========== --

-- https://github.com/VonHeikemen/nvim-starter/blob/04-lsp-installer/init.lua
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

-- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/
