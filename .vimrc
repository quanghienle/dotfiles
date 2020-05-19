
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

filetype plugin indent on
syntax on
" if !exists('g:syntax_on')
"   syntax enable
" endif

" colorscheme PaperColor 
" colorscheme wombat256
" colorscheme mycolor

colorscheme palenight
set background=dark 
set termguicolors


let mapleader = ','

noremap <silent> <leader>ws 
      \ :w<CR>
      \ :source %<CR>
      \ :nohl<CR>

set splitbelow splitright
noremap <leader>sh :split<CR>
noremap <leader>sv :vsplit<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

inoremap <expr> <C-j> pumvisible() ? "<Down>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<Up>" : "<C-k>"

xnoremap <leader>y "+y
xnoremap p "_dP

set hlsearch incsearch     
nmap <Esc><Esc> :nohl<CR>
nnoremap i :nohl<CR>i
nmap G Gzz
nmap n nzz

nmap <leader>n :bn<CR>
nmap <tab> :bn<CR>
nmap <S-Tab> :bp<CR>
command Bd bp | sp | bn | bd

" nmap <leader>e H<leader><leader>w

" prevent open calling FZF within NERDTree
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

nnoremap <leader>sf :call FZFOpen(':Files')<CR>
nnoremap <C-p> :call FZFOpen(':Files')<CR>
nnoremap <leader>ss :call FZFOpen(':Ag')<CR>

" Toggle signcolumn
function! ToggleSignColumn()
    if (&signcolumn == "yes")
        set signcolumn=no
    else
        set signcolumn=yes
    endif
endfunction

nmap <leader>sc :call ToggleSignColumn()<CR>

let g:gitgutter_sign_modified_removed = '≃'

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

let NERDTreeShowHidden = 1
let g:netrw_dirhistmax = 0
nnoremap <leader>t :NERDTreeToggle<CR>

function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction

nnoremap <leader>t :call NerdTreeToggleFind()<CR><C-w>=

let NERDTreeHighlightCursorline=1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

let g:rainbow_active = 1
" let g:rbpt_max = 7
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_theme='deus' "palenight
let g:airline_theme='palenight'
let g:airline_section_y = ''
let g:airline_section_warning = ''
let g:airline_skip_empty_sections = 1

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_auto_insert_bullets = 0

let g:surround_{char2nr('b')} = "__\r__"
let g:surround_{char2nr('c')} = "<center>\r</center>"
  
set path+=**
set ruler textwidth=100 shiftwidth=2 pumheight=10
set nocompatible noswapfile nowrap
set showcmd shellcmdflag=-c
set expandtab softtabstop=2 tabstop=2 backspace=2
set autoindent autoread ignorecase smartcase  
set clipboard=unnamed directory-=. encoding=utf-8
set laststatus=2 scrolloff=3
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu wildmode=longest,list,full
set mouse=a
set hidden nobackup nowritebackup noerrorbells
set updatetime=300
set shortmess+=c

set number signcolumn=auto relativenumber 
set cursorline cursorlineopt=both "number

" autocmd FileType list,nerdtree setlocal cursorlineopt=both

" show highlight colors
" :so $VIMRUNTIME/syntax/hitest.vim

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorlineopt=both
  autocmd WinLeave * setlocal cursorlineopt=number
augroup END


hi DiffAdd         guibg=#306f6b     guifg=NONE
hi DiffDelete      guibg=#2c2f45        guifg=#f50a04    gui=BOLD
hi DiffChange      guibg=#383656     guifg=NONE
hi DiffText        guibg=#4e4c78     guifg=NONE

hi CursorLineNr    guibg=NONE        guifg=#f802ea     gui=BOLD term=BOLD
hi LineNr          guibg=NONE        guifg=#5c6593
hi! link NonText    LineNr
hi! link VertSplit  LineNr

hi Visual          guibg=#565c7d
hi Search          guibg=#6d847f     guifg=#511b72     gui=BOLD
hi IncSearch       guibg=#21fa06     guifg=#511b72     gui=BOLD
hi CursorLine      guibg=#3b3f5e

" for clojure keywords
hi Keyword         guibg=NONE        guifg=#d7a4fb

" hi Normal          guibg=#212333
" hi Normal          guibg=NONE 
hi Normal          guibg=#30334b
hi Pmenu           guibg=#414863
hi PmenuSel        guibg=#6A3EB5     guifg=#bfc7d5     gui=BOLD
hi PmenuSbar       guibg=#352B59     guifg=#352B59
hi PmenuThumb      guibg=#352B59     guifg=#352B59

let g:fzf_colors = {
            \ 'bg+':     ['bg', 'CursorLine'],
            \ 'gutter':  ['bg', 'DiffDelete'],
            \ 'bg':      ['bg', 'DiffDelete'],
            \ 'border':  ['fg', 'Function']}

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

