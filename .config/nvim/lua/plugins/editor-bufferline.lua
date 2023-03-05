-- https://github.com/akinsho/bufferline.nvim/blob/main/doc/bufferline.txt

local Plugin = { 'akinsho/bufferline.nvim' }

Plugin.name = "bufferline"

Plugin.opts = {
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
}

return Plugin
