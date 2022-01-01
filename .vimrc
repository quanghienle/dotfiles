
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-surround'
Plug 'plasticboy/vim-markdown'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'flazz/vim-colorschemes'
Plug 'easymotion/vim-easymotion'
Plug 'kien/rainbow_parentheses.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'NLKNguyen/papercolor-theme'
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
Plug 'drewtempelmeyer/palenight.vim'

Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'dkanas/phosphor.vim'

Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Plug 'nathanaelkane/vim-indent-guides'

Plug 'sheerun/vim-polyglot'
Plug 'alvan/vim-closetag'
" Plug 'stephpy/vim-php-cs-fixer'

call plug#end()

filetype plugin indent on
syntax on
"   syntax enable
" endif
" if !exists('g:syntax_on')

" colorscheme PaperColor 
" colorscheme wombat256
" colorscheme mycolor

colorscheme palenight
" colorscheme phosphor
set background=dark 
set termguicolors

let mapleader = ','

noremap <silent> <leader>ws :w<CR>:source %<CR>:nohl<CR>

set splitbelow splitright
noremap <leader>sh :split<CR>
noremap <leader>sv :vsplit<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" nnoremap <esc> :noh<return><esc>

inoremap <expr> <C-j> pumvisible() ? "<Down>" : "<C-j>"
inoremap <expr> <C-k> pumvisible() ? "<Up>" : "<C-k>"

xnoremap <leader>y "+y
xnoremap p "_dP
nmap <leader>sw yiw/<C-r>"

nnoremap cn *``cgn
nnoremap cN *``cgN
nnoremap Y y$

set hlsearch incsearch     
" nmap <leader><esc> :nohl<CR>
nnoremap i :nohl<CR>i
nmap G Gzz
nmap n nzz

nmap <tab> :bn<CR>
nmap <S-Tab> :bp<CR>
command Bd bp | sp | bn | bd

" PHP setup
" let g:php_cs_fixer_rules = "@PSR2"          " options: --rules (default:@PSR2)
" let g:php_cs_fixer_php_path = "php"               " Path to PHP
" let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
" let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
" let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.
" 
" nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
" nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>
"
" au BufRead,BufNewFile *.tpl set filetype=smarty
au BufRead,BufNewFile *.tpl set filetype=html

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.tpl,*.php'
let g:closetag_filetypes = 'html,xhtml,phtml,tpl,php'

if executable('intelephense')
  augroup LspPHPIntelephense
    au!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'intelephense',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
        \ 'whitelist': ['php'],
        \ 'initialization_options': {'storagePath': '/tmp/intelephense'},
        \ 'workspace_config': {
        \   'intelephense': {
        \     'files': {
        \       'maxSize': 1000000,
        \       'associations': ['*.php', '*.phtml'],
        \       'exclude': [],
        \     },
        \     'completion': {
        \       'insertUseDeclaration': v:true,
        \       'fullyQualifyGlobalConstantsAndFunctions': v:false,
        \       'triggerParameterHints': v:true,
        \       'maxItems': 100,
        \     },
        \     'format': {
        \       'enable': v:true
        \     },
        \   },
        \ }
        \})
  augroup END
endif

let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8  }  }

function! s:fzf_preview_p(bang, ...) abort
    let preview_args = get(g:, 'fzf_preview_window', ['right:50%', 'ctrl-/'])
    if empty(preview_args)
        return { 'options': ['--preview-window', 'hidden'] }
    endif

    " For backward-compatiblity
    if type(preview_args) == type('')
        let preview_args = [preview_args]
    endif
    return call('fzf#vim#with_preview', extend(copy(a:000), preview_args))
endfunction

command! -bar -bang MarksPreview
    \ call fzf#vim#marks(
    \     s:fzf_preview_p(<bang>0, {'placeholder': '$([ -r $(echo {4} | sed "s#^~#$HOME#") ] && echo {4} || echo ' . fzf#shellescape(expand('%')) . '):{2}',
    \               'options': '--preview-window +{2}-/2'}),
    \     <bang>0)

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)


" prevent open calling FZF within NERDTree
function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

nnoremap <leader>sf :call FZFOpen(':Files')<CR>
vnoremap <leader>sf "py:execute ":FZF -q " . getreg("p")<CR>

nnoremap <C-p> :call FZFOpen(':Files')<CR>

nnoremap <leader>sa :call FZFOpen(':Ag')<CR>
xnoremap <leader>sa "py:call FZFOpen(':Ag ' . getreg("p"))<CR>

nnoremap <leader>sl :call FZFOpen(':Lines')<CR>
nnoremap <leader>sb :call FZFOpen(':Buffers')<CR>
nnoremap <leader>sm :call FZFOpen(':MarksPreview')<CR>

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
let NERDTreeShowLineNumbers = 1
autocmd FileType nerdtree setlocal relativenumber

let g:rainbow_active = 1
" let g:rbpt_max = 7
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" let g:indent_guides_guide_size = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#3b4569
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3b4569
" let g:indent_guides_enable_on_vim_startup = 1
    "sdfsdf
        "sdfsdfsdf
        "
" autocmd FileType javascript nnoremap <buffer> <C-]> :TernDef<CR>

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
set ruler textwidth=100 shiftwidth=4 pumheight=10
set nocompatible noswapfile nowrap
set showcmd shellcmdflag=-c
set expandtab softtabstop=4 tabstop=4 backspace=2
set autoindent autoread ignorecase smartcase  
set clipboard=unnamed directory-=. encoding=utf-8
set laststatus=2 scrolloff=8
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu wildmode=longest,list,full
set mouse=a
set hidden nobackup nowritebackup noerrorbells
set updatetime=300
set shortmess+=c

set number signcolumn=yes relativenumber 
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
hi DiffDelete      guibg=#2c2f45     guifg=#f50a04    gui=BOLD
hi DiffChange      guibg=#383656     guifg=NONE
hi DiffText        guibg=#4e4c78     guifg=NONE

hi CursorLineNr     guibg=NONE        guifg=#f802ea     gui=BOLD term=BOLD
hi LineNr           guibg=NONE        guifg=#5c6593
hi! link NonText    LineNr
hi! link VertSplit  LineNr

hi Visual          guibg=#565c7d
hi Search          guibg=#6d847f     guifg=#511b72     gui=BOLD
hi IncSearch       guibg=#21fa06     guifg=#511b72     gui=BOLD
hi CursorLine      guibg=#3b3f5e

" for clojure keywords
hi Keyword         guibg=NONE        guifg=#d7a4fb

" hi Normal          guibg=#212333
" hi Normal          guibg=#30334b
hi Normal          guibg=NONE
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


