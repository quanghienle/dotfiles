
if !exists('g:syntax_on')
	syntax enable
endif
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
" Plug 'ryanoasis/vim-devicons'
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
Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin indent on
syntax on

" colorscheme PaperColor 
" colorscheme wombat256
colorscheme mycolor
set background=dark

let mapleader = ','

noremap <silent> <leader>ws 
      \ :w<CR>
      \ :source %<CR>
      \ :nohl<CR>

set splitbelow splitright
noremap <leader>sh :split<CR>
noremap <leader>sv :vsplit<CR>

vnoremap <leader>y :w !pbcopy<CR><CR>

set hlsearch incsearch     
nmap <Esc><Esc> :nohl<CR>
nnoremap i :nohl<CR>i
nmap G Gzz
nmap n nzz

nmap <leader>bn :bn<CR>
nmap <leader>bp :bp<CR>
nmap <leader>bd :bd<CR>

let g:gitgutter_sign_modified_removed = '≃'
let g:gitgutter_enabled = 0

nmap <leader>git :Gdiff<CR>

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
let g:rbpt_max = 8
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'
" let g:airline_section_x = ''
let g:airline_skip_empty_sections = 1

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0

let g:surround_{char2nr('b')} = "__\r__"
let g:surround_{char2nr('c')} = "<center>\r</center>"


set pumheight=10
set nocompatible noswapfile nowrap
set showcmd shellcmdflag=-c
set ruler textwidth=100 shiftwidth=2
set expandtab softtabstop=2 tabstop=8 backspace=2
set autoindent autoread ignorecase smartcase  
set clipboard=unnamed directory-=.    
set encoding=utf-8
set laststatus=2 scrolloff=3
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu wildmode=longest,list,full
set mouse=a
set hidden nobackup nowritebackup
set updatetime=300
set shortmess+=c

set number relativenumber signcolumn=no


highlight Visual                ctermbg=60   
highlight Search                ctermbg=60      ctermfg=231
highlight IncSearch             ctermbg=232     ctermfg=135
highlight LineNr                ctermbg=None    ctermfg=60
highlight SignColumn            ctermbg=None
highlight CursorLineNr          ctermbg=None    ctermfg=141 cterm=bold
highlight Normal                ctermbg=None
highlight NonText               ctermbg=None

highlight DiffAdd               ctermbg=29      ctermfg=194
highlight DiffDelete            ctermbg=210
highlight DiffChange            ctermbg=60
highlight DiffText              ctermbg=103

highlight GitGutterAdd          ctermbg=None    ctermfg=2
highlight GitGutterChange       ctermbg=None    ctermfg=11
highlight GitGutterChangeDelete ctermbg=None    ctermfg=13
highlight GitGutterDelete       ctermbg=None    ctermfg=1

highlight VertSplit             ctermbg=None    ctermfg=111   cterm=None
set fillchars+=vert:│

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

nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

