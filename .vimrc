set nocompatible
syntax enable
filetype plugin on

" ================= Plugins ==================
" add plugin, save and close, run :PluginInstall
"
call plug#begin('~/.vim/plugged')

Plug 'srcery-colors/srcery-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'wlangstroth/vim-racket'

call plug#end()

"source ~/.vim/my-colors.vim

filetype plugin indent on
syntax on

" dracula, ir_black, spacegray, basic
colorscheme ir_black 

" ============== keyboard shortcuts ==============
" :map is recursive | :noremap is non-recursive
" mode letters: n[normal], v[visual], i[insert]

let mapleader = ','

" esc key
" imap <leader>q \<Esc>
inoremap jj <Esc>
inoremap <F2> <Esc>:w<CR>i
inoremap jk <C-o>
vnoremap jj <Esc>

" split and navigate between panes
nmap G Gzz
nmap n nzz
nmap N Nzz
noremap <leader>h :split<CR>
noremap <leader>v :vsplit<CR>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Plugin mapping
noremap <leader>pi :PlugInstall<CR>
nnoremap <leader>t :NERDTreeToggle<CR>

" source/edit vim
noremap <silent> <leader>rv :w<CR>:nohl<CR>:source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" copy selected text to system clipboard
vnoremap <leader>y :w !pbcopy<CR><CR>

"increase search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" :h g:incsearch#auto_nohlsearch
set hlsearch
nmap <Esc><Esc> :nohl<CR>
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

let g:instant_markdown_open_to_the_world = 1
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let NERDTreeShowHidden = 1
let g:rainbow_active = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:netrw_dirhistmax = 0
let g:airline_theme='kolor'    "themes: dracula, molokai, kolor...

set expandtab

set nofoldenable    " disable folding
set background=dark
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set mouse=a

set splitbelow
set splitright

set nowrap

" Rainbow parenthesis
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:ctrlp_working_path_mode = 0

"Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=racket
    au filetype racket set lisp
    au filetype racket set autoindent
endif

let g:srcery_transparent_background=1

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

highlight LineNr term=bold ctermfg=DarkGrey guifg=DarkGrey

runtime! macros/matchit.vim
