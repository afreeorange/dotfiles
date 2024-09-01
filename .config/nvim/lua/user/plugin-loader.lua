-- Set up lazy.nvim if it's not installed. This line can be removed after
-- inital setup. But it appears to make very little difference to this almighty
-- startup time people appear to be concerned about 🤷‍♂️

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')

    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable',
      path,
    })
  end
end

function lazy.setup(plugins)
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({ { import = 'plugins' } })
