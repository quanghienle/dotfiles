
set background=dark

if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

let colors_name = "mycolor"


" General colors
hi Cursor		ctermfg=234		ctermbg=228		cterm=none	
hi VisualNOS	        ctermfg=251		ctermbg=236		cterm=none
hi Folded		ctermfg=103		ctermbg=237		cterm=none
hi Title		ctermfg=230				      	cterm=bold
hi StatusLine	        ctermfg=230		ctermbg=238		cterm=none
hi StatusLineNC	        ctermfg=241		ctermbg=238		cterm=none
hi SpecialKey	        ctermfg=241		ctermbg=235		cterm=none
hi WarningMsg	        ctermfg=203						
hi ErrorMsg		ctermfg=196		ctermbg=236		cterm=bold

hi CursorLine					ctermbg=236		cterm=none
hi MatchParen	        ctermfg=228		ctermbg=101		cterm=bold

hi Pmenu		ctermfg=230		ctermbg=60
hi PmenuSel		ctermfg=16		ctermbg=147
hi PmenuSbar                                    ctermbg=None

hi Directory            ctermfg=147                                     cterm=bold  

" Syntax highlighting
hi Keyword		ctermfg=111		cterm=none	
hi Statement	        ctermfg=111		cterm=none
hi Constant		ctermfg=173		cterm=none
hi Number		ctermfg=173		cterm=none
hi PreProc		ctermfg=183		cterm=none
hi Function		ctermfg=183		cterm=none
hi Identifier	        ctermfg=192		cterm=none
hi Type			ctermfg=186		cterm=none
hi Special		ctermfg=183		cterm=none
hi String		ctermfg=157		cterm=none
hi Comment		ctermfg=246		cterm=none
hi Todo			ctermfg=101		cterm=none


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

