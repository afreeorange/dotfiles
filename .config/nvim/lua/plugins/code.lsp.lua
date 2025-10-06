-- Neovim v0.11+ comes with an LSP Client:
-- https://neovim.io/doc/user/lsp.html#_quickstart
--
-- But this client assumes that an LSP server is on $PATH. You'll also have
-- to provide configuration to the server. So we need a way to:
--
-- 1) Manage LSP servers: that's what Mason does. I won't be using mason-lspconfig.
--    The 'automatic' enabling doesn't appear to work for me.
--
-- 2) Provide any useful default configurations: that's what neovim/nvim-lspconfig does)
--    What I mean by 'configurations' is, for example, filetype associations and
--    some helpful defaults passed to the installed LSP Server.
--    See the whole list here:
--    https://github.com/neovim/nvim-lspconfig/tree/master/lsp
--
-- Now you can use `:LspInfo` (or `:checkhealth vim.lsp`)  to see which servers
-- are active/running.
--

local Plugin = {"neovim/nvim-lspconfig"}

-- Available servers for nvim-lspconfig
-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
--
-- NOTE: These are only when you're just setting up Neovim!
--
local servers = {
  "bashls",
  "biome",
  "cssls",
  "emmet_ls",
  "eslint",
  "html",
  "jsonls",
  "ltex-ls",
  "lua_ls",
  "rust_analyzer",
  "somesass_ls",
  "tailwindcss",
  "ts_ls",
  "yamlls"
}

Plugin.dependencies = {
  {
    { "nvim-mini/mini.completion", version = '*', opts = {} },
  },
  {
    "mason-org/mason.nvim",
    -- https://github.com/mason-org/mason.nvim?tab=readme-ov-file#default-configuration
    -- You need empty opts for the :Mason command to show up...  I don't know why.
    --
    opts = {}
  },
}

Plugin.event = {"BufReadPre", "BufNewFile"} -- When to load this plugin

for _, server in ipairs(servers) do
  vim.lsp.enable(server)
end

return Plugin

------------------------------------------------------------------------------

-- Without mason-lspconfig, you'd do this:

-- for _, server in ipairs(servers) do
--   _server = server
--
--   -- Hot shit: https://github.com/neovim/nvim-lspconfig/pull/3232
--   if server == "tsserver" then
--     _server = "ts_ls"
--   end
--
--   vim.lsp.enable(_server)
-- end

------------------------------------------------------------------------------

-- References:
-- https://old.reddit.com/r/neovim/comments/w7s1dr/neovimnvimlspconfig_vs_masonnvim_nvimlspinstaller/ihlciq4/

------------------------------------------------------------------------------


-- Plugin.dependencies = {
--   {
--    "williamboman/mason.nvim",
--   --  "williamboman/mason-lspconfig.nvim",
--   --  "hrsh7th/nvim-cmp",
--   --  "hrsh7th/cmp-nvim-lsp"
--   }
-- }


-- --   -- LSP Server
-- --   {
-- --     "neovim/nvim-lspconfig",


-- --     -- Show error messages when the LSP server complains about something
-- --     init = function()
-- --       local sign = function(opts)
-- --         vim.fn.sign_define(opts.name, { -- See :help sign_define()
-- --             texthl = opts.name,
-- --             text = opts.text,
-- --             numhl = ''
-- --         })
-- --       end
-- --       sign({
-- --           name = 'DiagnosticSignError',
-- --           text = '✘'
-- --       })
-- --       sign({
-- --           name = 'DiagnosticSignWarn',
-- --           text = '▲'
-- --       })
-- --       sign({
-- --           name = 'DiagnosticSignHint',
-- --           text = '⚑'
-- --       })
-- --       sign({
-- --           name = 'DiagnosticSignInfo',
-- --           text = '»'
-- --       })

-- --       -- -- See :help vim.diagnostic.config()
-- --       -- vim.diagnostic.config({
-- --       --     virtual_text = true,
-- --       --     severity_sort = true,
-- --       --     float = {
-- --       --         border = 'rounded',
-- --       --         source = 'always'
-- --       --     }
-- --       -- })
-- --       end
-- --   }
-- -- }
