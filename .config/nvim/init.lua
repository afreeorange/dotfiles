require("user.options")
require("user.commands")
require("user.key-mappings")
require("user.plugin-loader")

-- =========== REFERENCES ========== --

-- Nerd Fonts
-- https://www.nerdfonts.com/cheat-sheet

-- Build your first Neovim configuration in lua
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/

-- Setup nvim-lspconfig + nvim-cmp
-- https://vonheikemen.github.io/devlog/tools/setup-nvim-lspconfig-plus-nvim-cmp/

-- NeoVim starter. Excellent stuff.
-- https://github.com/VonHeikemen/nvim-starter/

-- Kick start template
-- https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua

-- Getting Started with Neovim
-- https://bryankegley.me/posts/nvim-getting-started/

-- Possible plugins
-- https://github.com/moll/vim-bbye

-- ---
-- -- Diagnostic customization
-- ---
-- local sign = function(opts)
--   -- See :help sign_define()
--   vim.fn.sign_define(opts.name, {
--     texthl = opts.name,
--     text = opts.text,
--     numhl = ''
--   })
-- end

-- sign({ name = 'DiagnosticSignError', text = '✘' })
-- sign({ name = 'DiagnosticSignWarn', text = '▲' })
-- sign({ name = 'DiagnosticSignHint', text = '⚑' })
-- sign({ name = 'DiagnosticSignInfo', text = '' })

-- -- See :help vim.diagnostic.config()
-- vim.diagnostic.config({
--   virtual_text = false,
--   severity_sort = true,
--   float = {
--     border = 'rounded',
--     source = 'always',
--   },
-- })

-- vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
--   vim.lsp.handlers.hover,
--   { border = 'rounded' }
-- )

-- vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
--   vim.lsp.handlers.signature_help,
--   { border = 'rounded' }
-- )
