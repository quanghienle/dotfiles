
" lua files
lua require('plugins')
lua require('settings')
lua require('keymappings')
lua require('colorscheme')

lua require('plugins.nerdtree')
lua require('plugins.telescope')
lua require('plugins.treesitter')
lua require('plugins.symboloutline')
lua require('plugins.toggleterm')
"lua require('plugins.lspconfig')


au BufRead,BufNewFile *.tpl set filetype=html

let g:gitgutter_sign_modified_removed = '≃'

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='deus'
let g:airline_section_y = ''
let g:airline_section_warning = ''
let g:airline_skip_empty_sections = 1

autocmd User TelescopePreviewerLoaded setlocal wrap

" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

"" Formatting selected code.
"xmap <leader>fc  <Plug>(coc-format-selected)
"nmap <leader>fc  <Plug>(coc-format-selected)
