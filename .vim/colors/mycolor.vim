
set background=dark
set termguicolors

hi clear
let colors_name = "mycolor"

hi Visual                ctermbg=60                      guibg=#5e678b
hi Search                ctermbg=60      ctermfg=231     guibg=#494a6e     guifg=#cccccc    gui=none
hi IncSearch             ctermbg=232     ctermfg=135     guibg=#07f64b     guifg=#865ccd         gui=bold
hi LineNr                ctermbg=None    ctermfg=60      guibg=NONE        guifg=#7580aa
hi Normal                ctermbg=none                    guibg=#292D3E
hi NonText               ctermbg=None                    guibg=#1f2a4c


hi SignColumn            ctermbg=None                                 guibg=NONE
hi CursorLineNr          ctermbg=0       ctermfg=49     cterm=bold    guibg=#1f2a4c   gui=bold 
hi CursorLine            ctermbg=60      ctermfg=none   cterm=none    guibg=#444267

" hi DiffAdd               ctermbg=30    
" hi DiffDelete            ctermbg=203     ctermfg=203
" hi DiffChange            ctermbg=60
" hi DiffText              ctermbg=103

highlight VertSplit     ctermbg=None     ctermfg=111    cterm=None    guibg=NONE      guifg=#4a709a    gui=NONE
set fillchars+=vert:│

" General colors
" hi VisualNOS	        ctermfg=251		ctermbg=236		cterm=none
" hi Folded		ctermfg=103		ctermbg=237		cterm=none
" hi Title		ctermfg=230				      	cterm=bold
" hi StatusLine	        ctermfg=230		ctermbg=238		cterm=none
" hi StatusLineNC	        ctermfg=241		ctermbg=238		cterm=none
" hi SpecialKey	        ctermfg=241		ctermbg=235		cterm=none
" hi WarningMsg	        ctermfg=1						
" hi ErrorMsg		ctermfg=196		ctermbg=236		cterm=bold
" 
" hi MatchParen	        ctermfg=228		ctermbg=101		cterm=bold

hi Pmenu		ctermfg=230		ctermbg=60
hi PmenuSel		ctermfg=16		ctermbg=147
hi PmenuSbar                                    ctermbg=None

hi NERDTreeCWD          ctermfg=111             cterm=bold        guifg=#4a709a       gui=bold
hi Directory            ctermfg=111             cterm=bold        guifg=#4a709a       gui=bold

" Syntax highlighting
hi Keyword		ctermfg=111		cterm=none        guifg=#82aaff		
hi Statement	        ctermfg=111		cterm=none        guifg=#82aaff	
hi Constant		ctermfg=210		cterm=none        guifg=#f77a9b
hi Number		ctermfg=210		cterm=none        guifg=#f77a9b
hi PreProc		ctermfg=183		cterm=none        guifg=#c792ea
hi Function		ctermfg=183		cterm=none        guifg=#c792ea
hi Identifier	        ctermfg=186		cterm=none        guifg=#e2da4e
hi Type			ctermfg=186		cterm=none        guifg=#e2da4e
hi Special		ctermfg=183		cterm=none        guifg=#e88cf9
hi String		ctermfg=157		cterm=none        guifg=#c3e88d
hi Comment		ctermfg=246		cterm=none        guifg=#8d95ba
hi Todo			ctermfg=186		cterm=none        guifg=#e88cf9


" Links
hi! link FoldColumn		Folded
hi! link CursorColumn	CursorLine

"hi CursorIM
"hi Menu
"hi ModeMsg
"hi MoreMsg
"hi PmenuThumb
"hi Question
"hi Scrollbar
"hi SpellBad
"hi SpellCap
"hi SpellLocal
"hi SpellRare
"hi TabLine
"hi TabLineFill
"hi TabLineSel
"hi User1
"hi User9
"hi WildMenu

