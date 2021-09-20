" 🤷
filetype plugin indent on

" Show line numbers
set number

" Indentation behaviour
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight the line I'm on
set cursorline

" Show a ruler at various widths
set colorcolumn=79,100,120

" Force vertical diffing
set diffopt+=vertical

" Automatically change the directory to the file being edited
" Note: this might cause problems with plugins 🤷‍♂️
"set autochdir

" In netrw, don't show the banner
let g:netrw_banner=0

" Autoreload $MYVIMRC on save
" https://superuser.com/a/1120318
if has ('autocmd')
    augroup vimrc
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    augroup END
endif

" ------------- OS Detection --------------
" https://vi.stackexchange.com/a/2577
"
" Now you can say `if g:os == "Darwin"`
" Other values are "Linux" and "Windows"

if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

" ------------- Key Mappings --------------

" Tab control (Why am I not using Emacs again?)
map <C-n> :tabnew<CR>
map <C-[> :tabprevious<CR>
map <C-]> :tabnext<CR>
map <C-w> :tabclose<CR>

" Edit our $MYVIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Quote the current word
nnoremap <leader>" viw<ESC>a"<ESC>bi"<ESC>lel
nnoremap <leader>' viw<ESC>a'<ESC>bi'<ESC>lel

" Invoke the fuzzy finder
nnoremap <silent> <C-p> :FZF<CR>

" Show me the tree of files with NERDTree (habit from Sublime...)
nnoremap <silent> <C-k><C-b> :NERDTreeToggle<CR>
nnoremap <silent> <C-k><C-f> :NERDTreeFind<CR>

" Insert a Markdown picture tag
"nnoremap <leader>pi i![]()<Esc>2hi

" Auto match parentheses sans plugin
" By the great romainl: https://bit.ly/2Wx5h8t
" He has a few functions on that thread but I won't add until I
" get what he's doing
" inoremap (; (<CR>);<C-c>O<Tab>
" inoremap (, (<CR>),<C-c>O<Tab>
" inoremap {; {<CR>};<C-c>O<Tab>
" inoremap {, {<CR>},<C-c>O<Tab>
" inoremap [; [<CR>];<C-c>O<Tab>
" inoremap [, [<CR>],<C-c>O<Tab>

if g:os == "Darwin"
    " Alt/Option + z toggles wrapping
    nnoremap <silent> Ω :set wrap!<CR>

    " Alt/Option + n toggles line numbers
    nnoremap <silent> ¬ :set nonumber!<CR>
endif

" Insert a timestamp for my log posts
nmap <F3> i<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
imap <F3> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" Take the training wheels off: disable the arrow keys!
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
  exec 'cnoremap' key '<Nop>'
  exec 'inoremap' key '<Nop>'
  exec 'noremap' key '<Nop>'
  exec 'vnoremap' key '<Nop>'
endfor

let mapleader=","

" ------------- Plugin Loading --------------

" Use vim-plug and keep plugins here
call plug#begin('$HOME/.vim/plugged')

" Syntax
Plug 'cespare/vim-toml'
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'stephpy/vim-yaml'
Plug 'tpope/vim-markdown'
Plug 'SidOfc/mkdx'
Plug 'lepture/vim-jinja'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

" Utility
Plug 'dhruvasagar/vim-table-mode'      " Because I'm too lazy and inept to hack tabular.vim
Plug 'hashivim/vim-terraform'          " Autoformat Terraform files
Plug 'itspriddle/vim-shellcheck'       " Check bash scripts
Plug 'junegunn/fzf'                    " Fuzzy file finder! See .bash_profile for export
Plug 'mattn/emmet-vim'                 " Emmet!
Plug 'scrooloose/nerdcommenter'        " Because I don't want to copypasta key bindings I don't understand
Plug 'tpope/vim-fugitive'              " Amazing git integration <3
Plug 'tpope/vim-surround'              " Surround stuff with all sorts of things

" Colors, Themes, etc
Plug 'chriskempson/base16-vim'
Plug 'preservim/nerdtree'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'prabirshrestha/asyncomplete-emoji.vim'
"
"au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#emoji#get_source_options({
"    \ 'name': 'emoji',
"    \ 'allowlist': ['*'],
"    \ 'completor': function('asyncomplete#sources#emoji#completor'),
"    \ }))
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Initialize plugin system
call plug#end()

" ------------- Syntaxes --------------

autocmd FileType js set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType json set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType jsx set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make set shiftwidth=4 softtabstop=0 noexpandtab
autocmd FileType ts set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType tsx set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType yaml set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType yml set shiftwidth=2 softtabstop=2 expandtab

autocmd BufNewFile,BufRead *.sublime-settings set syntax=javascript
autocmd BufNewFile,BufRead *.tsx syntax=javascript
autocmd BufNewFile,BufRead *.scss set syntax=css

" ------------- Plugin Configuration --------------

" Make nice text tables <3
let g:table_mode_always_active=1

" Disable automatic folding in vim-markdown
let g:vim_markdown_folding_disabled=1

" Use Emmett everywhere
let g:user_emmet_mode='a'

" Remap the Emmett leader (C-y is a bit awkward).
" Still have to type the ',' !
let g:user_emmet_leader_key='<Leader>e'

" Terraform autoformatter
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" EditorConfig
let g:EditorConfig_core_mode = 'external_command'

" ------------- Colors --------------

" Access colors present in 256 colorspace, set theme
let base16colorspace=256
colorscheme base16-gruvbox-dark-pale

" ------------- References --------------
"
" http://stevelosh.com/blog/2010/09/coming-home-to-vim
" https://github.com/vim-airline/vim-airline/wiki/Dummies-Guide-to-the-status-bar-symbols-(Powerline-fonts)-on-Fedora,-Ubuntu-and-Windows
"
" A Good Vimrc
" https://dougblack.io/words/a-good-vimrc.html
"
" This is very lovely stuff:
" https://stackoverflow.com/a/61625741
"
"= GENERIC CLIPBOARD YANK  <F2>y (Y for Yank)
"= Yank the entire contents of the file into the clipboard; quit without saving.
"
"define F2 followed by y to be:
"|      Go to line 1.
"|      | From there, into the * buffer (system clipboard),
"|      | | yank to the end of the file.
"|      | | | Go to sleep for 1 second (to allow the clipboard to be updated).
"|      | | | |  Quit without saving the file.
"|      | | | |  |
map #2y 1G"*yG1gs:q!<CR>

" ------------- References --------------

" Reference for CoC and Autocompletion and the like
" https://github.com/meatwallace/dotfiles/blob/master/.vimrc
"
let g:coc_global_extensions = [
  "\ 'coc-eslint',
  "\ 'coc-git',
  "\ 'coc-html',
  "\ 'coc-jest',
  "\ 'coc-json',
  "\ 'coc-lists',
  "\ 'coc-pairs',
  "\ 'coc-prettier',
  "\ 'coc-python',
  "\ 'coc-rls',
  "\ 'coc-snippets',
  "\ 'coc-stylelint',
  \ 'coc-tsserver',
  "\ 'coc-yaml',
  "\ 'coc-yank',
  \ ]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" use tab for triggering completion and cycling through our completion list
inoremap <silent> <expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" use <S-TAB> for cycling backwards through the completion list if visible
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" use <C-,> to trigger completion
inoremap <silent> <expr> <C-,> coc#refresh()

" use <CR> to confirm completion if available, otherwise <C-g>u breaks our undo
" chain at the current position. CoC only does snippet insertion and editing
" on confirmation
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use [c and ]c to navigate diagnostics
nnoremap <silent> [c <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]c <Plug>(coc-diagnostic-next)

" remap keys for gotos
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" use K to show the documentation in a preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim', 'help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" highlight symbol under the cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" remap for reaming the current word
nnoremap <leader>rn <Plug>(coc-rename)

" format the selection region
xnoremap <leader>f <Plug>(coc-format-selected)
nnoremap <leader>f <Plug>(coc-format-selected)

augroup mygroup
  autocmd!

  " setup formatexpr specific filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

  " update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" run our codeAction of selected region, ex: `<leader>aap` for current
" paragraph
xnoremap <leader>a <Plug>(coc-codeaction-selected)
nnoremap <leader>a <Plug>(coc-codeaction-selected)

" run our codeAction on the current line
nnoremap <leader>ac <Plug>(coc-codeaction)

" autofix problem of the current line
nnoremap <leader>qf <Plug>(coc-fix-current)

" use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

"use `:Fold` to fold the current buffer
command! -nargs=? Fold :call CocAction('fold, <f-args>)

" using CocList
" show all diagnostics
nnoremap <silent> ,a :<C-u>CocList diagnostics<CR>

" manage extensions
nnoremap <silent> ,c :<C-u>CocList extensions<CR>

" find symbol in current document
nnoremap <silent> ,e :<C-u>CocList outline<CR>

" search workspace symbols
nnoremap <silent> ,s :<C-u>CocList -I symbols<CR>

" open yank list
nnoremap <silent> ,y :<C-u>CocList -A --normal yank<cr>

" do default action for next item
nnoremap <silent> ,j :<C-u>CocNext<CR>

" do default action for previous item
nnoremap <silent> ,k :<C-u>CocPrevious<CR>

" resume latest coc list
nnoremap <silent> ,p :<C-u>CocListResume<CR>

