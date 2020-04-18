" ================= Plugins ==================

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'kien/rainbow_parentheses.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'

call plug#end()


filetype plugin indent on
syntax enable


let mapleader = ','


noremap <silent> <leader>rv 
      \ :w<CR>
      \ :source ~/.vimrc<CR>
      \ :exe ":echo 'vimrc reloaded'"<CR>
      \ :nohl<CR>


set splitbelow
set splitright
noremap <leader>sh :split<CR>
noremap <leader>sv :vsplit<CR>


vnoremap <leader>y "+y


set hlsearch
nmap <Esc><Esc> :nohl<CR>
nnoremap i :nohl<CR>i
nmap G Gzz
nmap n nzz
nmap N Nzz


nmap <leader>bn :bn<CR>
nmap <leader>bp :bp<CR>
nmap <leader>bd :bd<CR>


let g:gitgutter_sign_modified_removed = '≃'
nmap <leader>git :GitGutterToggle<CR>


let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)


let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_working_path_mode = 0


let NERDTreeShowHidden = 1
let g:netrw_dirhistmax = 0
nnoremap <leader>t :NERDTreeToggle<CR>


let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1


let g:rainbow_active = 1
let g:rbpt_max = 5
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'


let g:surround_{char2nr('b')} = "__\r__"
let g:surround_{char2nr('c')} = "<center>\r</center>"


set nocompatible
set nowrap
set shellcmdflag=-ic
set textwidth=100
set expandtab
set autoindent
set autoread
set backspace=2
set clipboard=unnamed
set directory-=.    
set encoding=utf-8
set ignorecase     
set incsearch     
set laststatus=2 
set ruler       
set scrolloff=3
set shiftwidth=2
set showcmd
set smartcase  
set softtabstop=2 
set tabstop=8 
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu     
set wildmode=longest,list,full
set mouse=a
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c


set number
set relativenumber

colorscheme PaperColor 
set background=dark

highlight LineNr       ctermbg=None ctermfg=60 
highlight SignColumn   ctermbg=None
highlight CursorLineNr ctermbg=None ctermfg=81
highlight Normal       ctermbg=None
highlight NonText      ctermbg=None

highlight GitGutterAdd          ctermfg=2 ctermbg=None
highlight GitGutterChange       ctermfg=11 ctermbg=None
highlight GitGutterChangeDelete ctermfg=13 ctermbg=None
highlight GitGutterDelete       ctermfg=1 ctermbg=None

highlight VertSplit cterm=None ctermfg=61 ctermbg=None
set fillchars+=vert:│


au BufRead,BufNewFile *.md setlocal textwidth=100
nmap <leader>mf :CocCommand markdownlint.fixAll<CR>Ggqgg


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)


" Mappings using CoCList:
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

