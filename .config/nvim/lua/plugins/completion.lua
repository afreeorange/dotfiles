local Plugin = { 'hrsh7th/nvim-cmp' }

Plugin.dependencies = {
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-path' },
}

Plugin.event = 'InsertEnter'

function Plugin.config()
  vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

  local cmp = require('cmp')
  local select_opts = { behavior = cmp.SelectBehavior.Select }

  -- See :help cmp-config
  cmp.setup({
    sources = {
      { name = 'path' },
      { name = 'nvim_lsp', keyword_length = 1 },
      { name = 'buffer',   keyword_length = 3 },
    },
    window = {
      documentation = cmp.config.window.bordered()
    },
    formatting = {
      fields = { 'menu', 'abbr', 'kind' },
      format = function(entry, item)
        local menu_icon = {
          nvim_lsp = 'λ',
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
    },
  })
end

return Plugin
