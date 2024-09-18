-- https://github.com/nvim-telescope/telescope.nvim#default-mappings
--
-- Lots of extensions!
-- https://github.com/nvim-telescope/telescope.nvim/wiki/Extensions
--
--
local Plugin = {
    "nvim-telescope/telescope.nvim",
    name = "telescope",
    tag = '0.1.8',
    dependencies = {'nvim-lua/plenary.nvim', {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    }},

    config = function()
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = {"node_modules", ".git"},
                color_devicons = true,
                borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
                -- file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                layout_strategy = "horizontal",
                path_display = {"truncate"},
                layout_config = {
                    width = 0.80, -- Percent of viewport/width/whatever
                    height = 0.95, -- Ditto but height
                    preview_cutoff = 120,
                    horizontal = {
                        prompt_position = "top",
                        results_width = 0.45, -- (1 - x)
                        preview_width = 0.55 -- (x)
                    },
                    vertical = {
                        mirror = false
                    }
                }
            }
        }
    end
}

function Plugin.init()
    require('telescope').load_extension('fzf')

    vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files hidden=true<cr>')
    vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
    vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
    vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
end

return Plugin
