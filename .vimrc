set nocompatible
syntax enable
filetype plugin on

" ================= Plugins ==================
" add plugin, save and close, run :PluginInstall
"
call plug#begin('~/.vim/plugged')

" Plug 'srcery-colors/srcery-vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'kien/rainbow_parentheses.vim'
Plug 'wlangstroth/vim-racket'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'

call plug#end()


filetype plugin indent on
syntax on

" dracula, ir_black, spacegray, basic
colorscheme PaperColor 

" ============== keyboard shortcuts ==============
" :map is recursive | :noremap is non-recursive
" mode letters: n[normal], v[visual], i[insert]

let mapleader = ','

" split and navigate between panes
nmap G Gzz
nmap n nzz
nmap N Nzz
noremap <leader>h :split<CR>
noremap <leader>v :vsplit<CR>

noremap <silent> <leader>rv :w<CR>
      \ :nohl<CR>
      \ :source ~/.vimrc<CR>
      \ :filetype detect<CR>
      \ :exe ":echo 'vimrc reloaded'"<CR>


" copy selected text to system clipboard
vnoremap <leader>y :w !pbcopy<CR><CR>

set hlsearch
nmap <Esc><Esc> :nohl<CR>
nnoremap i :nohl<CR>i

let g:gitgutter_sign_modified_removed = '≃'
nmap <leader>git :GitGutterToggle<CR>


let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

let NERDTreeShowHidden = 1
let g:netrw_dirhistmax = 0
nnoremap <leader>t :NERDTreeToggle<CR>

" Rainbow parenthesis
let g:rainbow_active = 1
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='deus'    "themes: dracula, molokai, kolor...

let g:surround_{char2nr('b')} = "__\r__"
let g:surround_{char2nr('c')} = "<center>\r</center>"

let g:ctrlp_working_path_mode = 0

set nowrap
set expandtab
set nofoldenable    " disable folding
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set clipboard=unnamed                                        " yank and paste with the system clipboard
set directory-=.                                             " don't store swapfiles in the current directory
set encoding=utf-8
set ignorecase                                               " case-insensitive search
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
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

set number
set relativenumber

set background=dark

highlight LineNr ctermfg=60 ctermbg=None
highlight SignColumn ctermbg=None
highlight CursorLineNr ctermfg=11 ctermbg=None
highlight Normal guibg=None ctermbg=None
highlight NonText ctermbg=None
highlight VertSplit cterm=NONE ctermfg=60 ctermbg=None

highlight GitGutterAdd    ctermfg=2 ctermbg=None
highlight GitGutterChange ctermfg=3 ctermbg=None
highlight GitGutterDelete ctermfg=1 ctermbg=None

set fillchars+=vert:│

"Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

if has("autocmd")
    au BufReadPost *.rkt,*.rktl set filetype=racket
    au filetype racket set lisp
    au filetype racket set autoindent
endif


set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Mappings using CoCList:
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
