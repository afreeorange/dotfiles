-- Neovim v0.11+ comes with an LSP Client:
-- https://neovim.io/doc/user/lsp.html#_quickstart
--
-- But this client assumes that an LSP server is on $PATH. You'll also have
-- to provide configuration to the server. So we need a way to:
--
-- 1) Manage LSP servers: that's what Mason does. With mason-lspconfig.
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

-- Available server configurations for nvim-lspconfig.
-- https://github.com/neovim/nvim-lspconfig/tree/master/lsp
--
-- mason-lspconfig will ensure that these are installed and active based on the buffer.
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
  "tailwindcss",
  "ts_ls",
  "yamlls"
}

local Plugin = {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = servers
  },
  dependencies = {
        { "nvim-mini/mini.completion", version = '*', opts = {} },
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}

return Plugin

-- ------------------------------------------------------------------------------

-- What you'd do to enable manually (handled by mason-lspconfig)
-- for _, server in ipairs(servers) do
--   vim.lsp.enable(server)
-- end

-- ------------------------------------------------------------------------------

-- Plugin.event = {"BufReadPre", "BufNewFile"} -- When to load this plugin

-- ------------------------------------------------------------------------------

-- -- Without mason-lspconfig, you'd do this:

-- -- for _, server in ipairs(servers) do
-- --   _server = server
-- --   -- Hot shit: https://github.com/neovim/nvim-lspconfig/pull/3232
-- --   if server == "tsserver" then
-- --     _server = "ts_ls"
-- --   end
-- --   vim.lsp.enable(_server)
-- -- end

-- ------------------------------------------------------------------------------

-- -- References:
-- -- https://old.reddit.com/r/neovim/comments/w7s1dr/neovimnvimlspconfig_vs_masonnvim_nvimlspinstaller/ihlciq4/

-- ------------------------------------------------------------------------------

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
-- -- -- }
