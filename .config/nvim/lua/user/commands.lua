-- Autoreload $MYVIMRC on save
-- https://superuser.com/a/1120318
--
vim.cmd [[
if has ('autocmd')
    augroup vimrc
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    augroup END
endif
]]

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})
