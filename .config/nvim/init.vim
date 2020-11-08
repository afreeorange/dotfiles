" 🤷
filetype plugin indent on

" Show line numbers
set number

" Wrap long lines
set wrap

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

" In netrw, don't show the banner
let g:netrw_banner=0

" Autoreload $MYVIMRC on save
" https://superuser.com/a/1120318
if has ('autocmd')
    augroup vimrc
        autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    augroup END
endif

" ------------- Key Mappings --------------

" Tab control (Why am I not using emacs again?)
map <C-[> :tabprevious<CR>
map <C-]> :tabnext<CR>
map <C-n> :tabnew<CR>

" Invoke the fuzzy finder
nnoremap <silent> <C-p> :FZF<CR>

" Show me the tree of files with netrw (habit from Sublime...)
nnoremap <silent> <C-k><C-b> :Vexplore<CR>

" Auto match parentheses sans plugin
" By the great romainl: https://bit.ly/2Wx5h8t
" He has a few functions on that thread but I won't add until I
" get what he's doing
inoremap (; (<CR>);<C-c>O<Tab>
inoremap (, (<CR>),<C-c>O<Tab>
inoremap {; {<CR>};<C-c>O<Tab>
inoremap {, {<CR>},<C-c>O<Tab>
inoremap [; [<CR>];<C-c>O<Tab>
inoremap [, [<CR>],<C-c>O<Tab>

let mapleader=","

" ------------- Plugin Loading --------------

" Use vim-plug and keep plugins here
call plug#begin('$HOME/.vim/plugged')

" Syntax
Plug 'editorconfig/editorconfig-vim'
Plug 'godlygeek/tabular'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-liquid'
Plug 'cespare/vim-toml'
Plug 'lepture/vim-jinja'
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

" Utility
Plug 'airblade/vim-gitgutter'          " Show changes to file if in a git repo
"Plug 'bling/vim-airline'               " Because everyone uses it :|
Plug 'dhruvasagar/vim-table-mode'      " Because I'm too lazy and inept to hack tabular.vim
Plug 'junegunn/fzf'                    " Fuzzy file finder! See .bash_profile for export
Plug 'junegunn/goyo.vim'               " Zen-like full-screen editing
Plug 'junegunn/limelight.vim'          " Focus on the stuff you want to edit... best with Goyo
Plug 'nelstrom/vim-visual-star-search' " Make * useful when searching
Plug 'tpope/vim-surround'              " Surround stuff with all sorts of things
Plug 'tpope/vim-fugitive'              " Amazing git integration <3
Plug 'mattn/emmet-vim'                 " Emmet!
Plug 'scrooloose/nerdcommenter'        " Because I don't want to copypasta key bindings I don't understand
Plug 'itspriddle/vim-shellcheck'       " Check bash scripts
Plug 'hashivim/vim-terraform'          " Autoformat Terraform files

" Colors
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

" ------------- Syntaxes --------------

autocmd FileType json set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType yaml set shiftwidth=2 softtabstop=2 expandtab
autocmd FileType make set shiftwidth=4 softtabstop=0 noexpandtab
autocmd BufNewFile,BufRead *.sublime-settings set syntax=javascript
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

" Enable LimeLight when in distraction-free mode
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Terraform autoformatter
let g:terraform_align=1
let g:terraform_fmt_on_save=1

" ------------- Colors --------------

" Access colors present in 256 colorspace, set theme
let base16colorspace=256
colorscheme base16-gruvbox-dark-pale

" ------------- References --------------
"
" http://stevelosh.com/blog/2010/09/coming-home-to-vim
" https://github.com/vim-airline/vim-airline/wiki/Dummies-Guide-to-the-status-bar-symbols-(Powerline-fonts)-on-Fedora,-Ubuntu-and-Windows

