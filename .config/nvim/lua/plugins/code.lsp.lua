-- References:
-- https://old.reddit.com/r/neovim/comments/w7s1dr/neovimnvimlspconfig_vs_masonnvim_nvimlspinstaller/ihlciq4/

-- Available servers
-- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
--
local servers = {
  "bashls",
  "biome",
  "cssls",
  "emmet_ls",
  "eslint",
  "html",
  "jsonls",
  "lua_ls",
  "rust_analyzer",
  "somesass_ls",
  "tailwindcss"
}

local Plugin = {"neovim/nvim-lspconfig"}

Plugin.dependencies = {
  {
   "williamboman/mason.nvim",
   "williamboman/mason-lspconfig.nvim",
   "hrsh7th/nvim-cmp",
   "hrsh7th/cmp-nvim-lsp"
  }
}

Plugin.event = {"BufReadPre", "BufNewFile"} -- When to load this plugin

-------------------------------------------------------------------------------

function Plugin.config()
  local lspconfig = require("lspconfig")
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = servers,
  })

  for _, server in ipairs(servers) do
    _server = server

    -- Hot shit.
    -- https://github.com/neovim/nvim-lspconfig/pull/3232
    if server == "tsserver" then
      _server = "ts_ls"
    end

    lspconfig[_server].setup {}
  end
end

-------------------------------------------------------------------------------

return Plugin

-- return {
--   -- LSP Server
--   {
--     "neovim/nvim-lspconfig",


--     -- Show error messages when the LSP server complains about something
--     init = function()
--       local sign = function(opts)
--         vim.fn.sign_define(opts.name, { -- See :help sign_define()
--             texthl = opts.name,
--             text = opts.text,
--             numhl = ''
--         })
--       end

--       sign({
--           name = 'DiagnosticSignError',
--           text = '✘'
--       })
--       sign({
--           name = 'DiagnosticSignWarn',
--           text = '▲'
--       })
--       sign({
--           name = 'DiagnosticSignHint',
--           text = '⚑'
--       })
--       sign({
--           name = 'DiagnosticSignInfo',
--           text = '»'
--       })

--       -- -- See :help vim.diagnostic.config()
--       -- vim.diagnostic.config({
--       --     virtual_text = true,
--       --     severity_sort = true,
--       --     float = {
--       --         border = 'rounded',
--       --         source = 'always'
--       --     }
--       -- })
--       end
--   }
-- }
