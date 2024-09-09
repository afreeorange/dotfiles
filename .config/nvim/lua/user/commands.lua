-- Autoreload $MYVIMRC on save
-- https://superuser.com/a/1120318
vim.cmd [[
if has ('autocmd')
  augroup vimrc
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
  augroup END
endif
]]
vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", {})

-- Automatically load the table format plugin when typing || or __
-- https://github.com/dhruvasagar/vim-table-mode?tab=readme-ov-file#creating-table-on-the-fly
vim.cmd [[
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
    \ <SID>isAtStartOfLine('\|\|') ?
    \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
    inoreabbrev <expr> __
    \ <SID>isAtStartOfLine('__') ?
    \ '<c-o>:silent! TableModeDisable<cr>' : '__'
]]
