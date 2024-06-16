local Plugin = { 'neovim/nvim-lspconfig' }
local user = {}

-------------------------------------------------------------------------------

-- Run this function whenever the LSP server attaches to a buffer (new or existing)
function user.on_attach()
  local bufmap = function(mode, lhs, rhs)
    local opts = { buffer = true }
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- You can search each function in the help page.
  -- For example :help vim.lsp.buf.hover()

  bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')
  bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')
  bufmap('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>')
  bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
  bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
  bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
  bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
  bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')
  bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')
  bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')
  bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
  bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')
  bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')
end

-- Run this function immediately after mason.nvim dependency is installed
function user.setup_mason()
  -- See :help mason-settings
  require('mason').setup({
    ui = { border = 'rounded' }
  })

  -- See :help mason-lspconfig-settings
  -- Available servers
  -- https://github.com/williamboman/mason-lspconfig.nvim?tab=readme-ov-file#available-lsp-servers
  require('mason-lspconfig').setup({
    ensure_installed = {
      'bashls',
      'cssls',
      'eslint',
      'html',
      'lua_ls',
      'tsserver',
    }
  })
end

-------------------------------------------------------------------------------

Plugin.cmd = 'LspInfo'

-- We use mason.nvim to manage LSP servers
-- We then use mason-lspconfig as a bridge between Mason and nvim-lspconfig
Plugin.dependencies = {
  -- { 'hrsh7th/cmp-nvim-lsp' },
  { 'williamboman/mason-lspconfig.nvim', lazy = true },
  {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'LspInstall', 'LspUnInstall' },
    config = function() user.setup_mason() end
  },
}

-- When to load this plugin
Plugin.event = { 'BufReadPre', 'BufNewFile' }

function Plugin.config()
  -- See :help lspconfig-global-defaults
  local lspconfig = require('lspconfig')
  local lsp_defaults = lspconfig.util.default_config

  -- lsp_defaults.capabilities = vim.tbl_deep_extend(
  --   'force',
  --   lsp_defaults.capabilities,
  --   require('cmp_nvim_lsp').default_capabilities()
  -- )

  local group = vim.api.nvim_create_augroup('lsp_cmds', { clear = true })
  vim.api.nvim_create_autocmd('LspAttach', {
    group = group,
    desc = 'LSP actions',
    callback = user.on_attach
  })

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
    end,
  })
end

function Plugin.init()
  -- This shows diagnostic information when the server encounters something it
  -- doesn't like in the code. Uses the leftmost column for all the diagnostic
  -- information.

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
  sign({ name = 'DiagnosticSignInfo', text = '»' })

  -- See :help vim.diagnostic.config()
  vim.diagnostic.config({
    virtual_text = true,
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
end

return Plugin
