set nocompatible
syntax enable

" ================= Plugins ==================
" add plugin, save and close, run :PluginInstall
"
call plug#begin('~/.vim/plugged')
Plug  'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'junegunn/limelight.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Clojure
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'luochen1990/rainbow'

call plug#end()


filetype plugin indent on
syntax on
" colorscheme gruvbox


" ============== keyboard shortcuts ==============
" :map is recursive | :noremap is non-recursive
" mode letters: n[normal], v[visual], i[insert]

let mapleader = ' '

" esc key
imap <leader>q \<Esc>
inoremap jj \<Esc>

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
nnoremap <leader>r :RangerCurrentFile<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
"nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>s :CtrlP<CR>
nnoremap <leader>S :CtrlPClearCache<CR>:CtrlP<CR>

" source/edit vim
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
nnoremap <leader>ev :tabnew $MYVIMRC<cr>

" Tab navigation
"nnoremap <leader>N :bprevious<CR>
"nnoremap <leader>n :bnext<CR>
nnoremap <leader>nt :tabnew<CR>

" copy selected text to system clipboard
vnoremap <leader>y :w !pbcopy<CR><CR>

" open and close parenthesis
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>


let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
let NERDTreeShowHidden = 1
let g:rainbow_active = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let vim_markdown_preview_github = 1
let vim_markdown_preview_browser = 'Google Chrome'
let vim_markdown_preview_hotkey = '<leader>md'
"let vim_markdown_preview_toggle = 2
let g:vim_markdown_folding_disabled = 1
let g:netrw_dirhistmax=0
let g:airline_theme='dracula'    "themes: dracula, molokai, kolor...

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
"set list                                                     " show trailing whitespace
"set listchars=tab:▸\ ,trail:▫
"set number                                                   " show line numbers
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

" line number coloring
"set number
highlight LineNr term=bold ctermfg=DarkGrey guifg=DarkGrey

runtime! macros/matchit.vim
