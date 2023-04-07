
" lua files
lua require('pluggins')
lua require('settings')
lua require('keymappings')
 
lua require('pluggin-config.nvimtree')
lua require('pluggin-config.telescope')
lua require('pluggin-config.treesitter')
lua require('pluggin-config.toggleterm')
lua require('pluggin-config.lualine')
lua require('pluggin-config.bufferline')
lua require('pluggin-config.lsp-config')
lua require('pluggin-config.cmp-config')
lua require('pluggin-config.gitsigns')
lua require('pluggin-config.autopairs')

lua require('colorscheme')

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

autocmd User TelescopePreviewerLoaded setlocal wrap number

"augroup CursorLineOnlyInActiveWindow
"  autocmd!
"  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorlineopt=both
"  autocmd WinLeave * setlocal cursorlineopt=number
"augroup END
