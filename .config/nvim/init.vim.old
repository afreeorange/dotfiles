" 🤷
filetype plugin indent on

" Show line numbers
set number

" Show relative line numbers <3
set relativenumber

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

" If the terminal supports it, enable mouse support in all ("a") modes
" set mouse=a

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

" Map leader is a default of the backslash key

" Tab control (Why am I not using Emacs again?)
map <C-n> :tabnew<CR>
map <C-[> :tabprevious<CR>
map <C-]> :tabnext<CR>
map <C-t> :tabclose<CR>

" Edit our $MYVIMRC
nnoremap <leader>ev :vsplit $MYVIMRC<CR>

" Quote the current word
nnoremap <leader>" viw<ESC>a"<ESC>bi"<ESC>lel
nnoremap <leader>' viw<ESC>a'<ESC>bi'<ESC>lel
nnoremap <leader>[ viw<ESC>a]<ESC>bi[<ESC>lel
nnoremap <leader>( viw<ESC>a)<ESC>bi(<ESC>lel

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

" Use `:set showcmd` to show the keystrokes in normal mode
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

" ------------- Plugin Loading --------------

" Use vim-plug and keep plugins here
call plug#begin('$HOME/.vim/plugged')

" Syntax
Plug 'SidOfc/mkdx'
Plug 'cespare/vim-toml'
Plug 'godlygeek/tabular'
Plug 'lepture/vim-jinja'
Plug 'stephpy/vim-yaml'

" Utility
Plug 'chrisbra/csv.vim'                " Parse CSV
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

