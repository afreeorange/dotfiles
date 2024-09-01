-- https://github.com/nvim-tree/nvim-tree.lua
--
local Plugin = {'nvim-tree/nvim-tree.lua'}

Plugin.name = "nvim-tree"

Plugin.dependencies = {'nvim-tree/nvim-web-devicons'}

Plugin.opts = {
    filters = {
        dotfiles = false,
        exclude = {vim.fn.stdpath "config" .. "/lua/custom"}
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = false
    },
    view = {
        adaptive_size = true,
        side = "left",
        width = 40
    },
    git = {
        enable = false,
        ignore = true
    },
    filesystem_watchers = {
        enable = true
    },
    actions = {
        open_file = {
            resize_window = true
        }
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = "none",
        indent_markers = {
            enable = false
        }
    }
}

function Plugin.init()
    -- Shortcut to toggle tree
    vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeToggle<cr>", {
        noremap = true,
        silent = true
    })

    -- Switch to the current directory in the tree
    vim.g.nvim_tree_respect_buf_cwd = 1
end

return Plugin
