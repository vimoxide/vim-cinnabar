" 'cinnabar.vim' -- Vim color scheme.
" Maintainer: pushqrdx (pushqrdx@gmail.com)
" Original Source: https://github.com/srcery-colors/srcery-vim

scriptencoding utf-8

set background=dark

if v:version > 580
  hi clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name='cinnabar'

if !has('gui_running') && &t_Co != 256
  finish
endif

" Palette {{{

let s:black          = ['#000000', 0]
let s:red            = ['#e04128', 1]
let s:green          = ['#5da602', 2]
let s:yellow         = ['#cfad00', 3]
let s:blue           = ['#417ab3', 4]
let s:magenta        = ['#88658d', 5]
let s:cyan           = ['#09ad95', 6]
let s:white          = ['#dbded8', 7]
let s:bright_black   = ['#999b97', 8]
let s:bright_red     = ['#f44135', 9]
let s:bright_green   = ['#7cb934', 10]
let s:bright_yellow  = ['#f2c744', 11]
let s:bright_blue    = ['#70b0c2', 12]
let s:bright_magenta = ['#be93b8', 13]
let s:bright_cyan    = ['#38e7be', 14]
let s:bright_white   = ['#f1f1ef', 15]

" xterm colors.
let s:orange        = ['#FF5F00', 202]
let s:bright_orange = ['#FF8700', 208]
let s:hard_black    = ['#121212', 233]
let s:xgray1        = ['#262626', 235]
let s:xgray2        = ['#303030', 236]
let s:xgray3        = ['#3A3A3A', 237]
let s:xgray4        = ['#444444', 238]
let s:xgray5        = ['#4E4E4E', 239]
let s:xgray6        = ['#585858', 240]
let s:xgray7        = ['#808080', 250]

"}}}
" Setup Variables: {{{

let s:none = ['NONE', 'NONE']

if !exists('g:cinnabar_bold')
  let g:cinnabar_bold=1
endif

if !exists('g:cinnabar_italic')
  if has('gui_running') || $TERM_ITALICS ==? 'true'
    let g:cinnabar_italic=1
  else
    let g:cinnabar_italic=0
  endif
endif

if !exists('g:cinnabar_transparent_background')
  let g:cinnabar_transparent_background=0
endif

if !exists('g:cinnabar_undercurl')
  let g:cinnabar_undercurl=1
endif

if !exists('g:cinnabar_underline')
  let g:cinnabar_underline=1
endif

if !exists('g:cinnabar_inverse')
  let g:cinnabar_inverse=1
endif

if !exists('g:cinnabar_inverse_matches')
  let g:cinnabar_inverse_matches=0
endif

if !exists('g:cinnabar_inverse_match_paren')
  let g:cinnabar_inverse_match_paren=0
endif

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:cinnabar_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:cinnabar_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:cinnabar_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:cinnabar_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:cinnabar_inverse == 0
  let s:inverse = ''
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let l:fg = a:fg

  " background
  if a:0 >= 1
    let l:bg = a:1
  else
    let l:bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let l:emstr = a:2
  else
    let l:emstr = 'NONE,'
  endif

  let l:histring = [ 'hi', a:group,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:emstr[:-2], 'cterm=' . l:emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(l:histring, 'guisp=' . a:3[0])
  endif

  execute join(l:histring, ' ')
endfunction
"}}}
" Hi Groups: {{{

" memoize common hi groups
call s:HL('cinnabarWhite', s:white)
call s:HL('cinnabarRed', s:red)
call s:HL('cinnabarGreen', s:green)
call s:HL('cinnabarYellow', s:yellow)
call s:HL('cinnabarBlue', s:blue)
call s:HL('cinnabarMagenta', s:magenta)
call s:HL('cinnabarCyan', s:cyan)
call s:HL('cinnabarBlack', s:black)

call s:HL('cinnabarRedBold', s:red, s:none, s:bold)
call s:HL('cinnabarGreenBold', s:green, s:none, s:bold)
call s:HL('cinnabarYellowBold', s:yellow, s:none, s:bold)
call s:HL('cinnabarBlueBold', s:blue, s:none, s:bold)
call s:HL('cinnabarMagentaBold', s:magenta, s:none, s:bold)
call s:HL('cinnabarCyanBold', s:cyan, s:none, s:bold)

call s:HL('cinnabarBrightRed', s:bright_red, s:none)
call s:HL('cinnabarBrightGreen', s:bright_green, s:none)
call s:HL('cinnabarBrightYellow', s:bright_yellow, s:none)
call s:HL('cinnabarBrightBlue', s:bright_blue, s:none)
call s:HL('cinnabarBrightMagenta', s:bright_magenta, s:none)
call s:HL('cinnabarBrightCyan', s:bright_cyan, s:none)
call s:HL('cinnabarBrightBlack', s:bright_black, s:none)
call s:HL('cinnabarBrightWhite', s:bright_white)

" special
call s:HL('cinnabarOrange', s:orange)
call s:HL('cinnabarBrightOrange', s:bright_orange)
call s:HL('cinnabarOrangeBold', s:orange, s:none, s:bold)
call s:HL('cinnabarHardBlack', s:hard_black)
call s:HL('cinnabarXgray1', s:xgray1)
call s:HL('cinnabarXgray2', s:xgray2)
call s:HL('cinnabarXgray3', s:xgray3)
call s:HL('cinnabarXgray4', s:xgray4)
call s:HL('cinnabarXgray5', s:xgray5)
call s:HL('cinnabarXgray6', s:xgray6)

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  " Normal colors
  let g:terminal_color_0 = s:black[0]
  let g:terminal_color_1 = s:red[0]
  let g:terminal_color_2 = s:green[0]
  let g:terminal_color_3 = s:yellow[0]
  let g:terminal_color_4 = s:blue[0]
  let g:terminal_color_5 = s:magenta[0]
  let g:terminal_color_6 = s:cyan[0]
  let g:terminal_color_7 = s:white[0]
  " Bright colors
  let g:terminal_color_8 = s:bright_black[0]
  let g:terminal_color_9 = s:bright_red[0]
  let g:terminal_color_10 = s:bright_green[0]
  let g:terminal_color_11 = s:bright_yellow[0]
  let g:terminal_color_12 = s:bright_blue[0]
  let g:terminal_color_13 = s:bright_magenta[0]
  let g:terminal_color_14 = s:bright_cyan[0]
  let g:terminal_color_15 = s:bright_white[0]
else
  let g:terminal_ansi_colors = repeat([0], 16)
  " Normal colors
  let g:terminal_ansi_colors[0] = s:black[0]
  let g:terminal_ansi_colors[1] = s:red[0]
  let g:terminal_ansi_colors[2] = s:green[0]
  let g:terminal_ansi_colors[3] = s:yellow[0]
  let g:terminal_ansi_colors[4] = s:blue[0]
  let g:terminal_ansi_colors[5] = s:magenta[0]
  let g:terminal_ansi_colors[6] = s:cyan[0]
  let g:terminal_ansi_colors[7] = s:white[0]
  " Bright colors
  let g:terminal_ansi_colors[8]  = s:bright_black[0]
  let g:terminal_ansi_colors[9]  = s:bright_red[0]
  let g:terminal_ansi_colors[10] = s:bright_green[0]
  let g:terminal_ansi_colors[11] = s:bright_yellow[0]
  let g:terminal_ansi_colors[12] = s:bright_blue[0]
  let g:terminal_ansi_colors[13] = s:bright_magenta[0]
  let g:terminal_ansi_colors[14] = s:bright_cyan[0]
  let g:terminal_ansi_colors[15] = s:bright_white[0]
endif

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
"
if g:cinnabar_transparent_background == 1 && !has('gui_running')
  call s:HL('Normal', s:bright_white, s:none)
 else
  call s:HL('Normal', s:bright_white, s:black)
endif

if v:version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:xgray2)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine


  if g:cinnabar_transparent_background == 1 && !has('gui_running')
    " Tab pages line filler
    call s:HL('TabLineFill', s:white, s:none)
    " Active tab page label
    call s:HL('TabLineSel', s:green, s:none, s:bold)
  else
    call s:HL('TabLineFill', s:white, s:black)
    call s:HL('TabLineSel', s:green, s:black, s:bold)
  endif

  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  "
  if g:cinnabar_inverse_match_paren == 1
    call s:HL('MatchParen', s:bright_magenta, s:none, s:inverse . s:bold)
  else
    call s:HL('MatchParen', s:bright_magenta, s:none, s:bold)
  endif
endif

if v:version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:xgray2)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  if g:cinnabar_transparent_background == 1 && !has('gui_running')
    call s:HL('CursorLineNr', s:yellow, s:none)
  else
    call s:HL('CursorLineNr', s:yellow, s:black)
  endif

endif

hi! link NonText cinnabarXgray4
hi! link SpecialKey cinnabarXgray4
hi! link EndOfBuffer cinnabarBlack

if g:cinnabar_inverse == 1
  call s:HL('Visual', s:none, s:none, s:inverse)
else
  call s:HL('Visual', s:none, s:xgray2, s:bold)
endif

hi! link VisualNOS Visual

if g:cinnabar_inverse == 1 && g:cinnabar_inverse_matches == 1
  call s:HL('Search', s:none, s:none, s:inverse)
  call s:HL('IncSearch', s:none, s:none, s:inverse)
else
  call s:HL('Search', s:none, s:xgray5, s:bold)
  call s:HL('IncSearch', s:none, s:xgray5, s:underline . s:bold)
endif

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bright_white, s:black)
call s:HL('StatusLineTerm',   s:bright_white, s:black)

if g:cinnabar_transparent_background == 1 && !has('gui_running')
  call s:HL('StatusLineNC', s:black, s:black)
  call s:HL('StatusLineTermNC', s:black, s:black)
  call s:HL('VertSplit', s:black, s:black)
  " Current match in wildmenu completion
  call s:HL('WildMenu', s:blue, s:none, s:bold)
else
  call s:HL('StatusLineNC', s:black, s:black)
  call s:HL('StatusLineTermNC', s:black, s:black)
  " call s:HL('VertSplit', s:bright_white, s:black)
  call s:HL('VertSplit', s:black, s:black)
  call s:HL('WildMenu', s:blue, s:black, s:bold)
endif

" Directory names, special names in listing
hi! link Directory cinnabarGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title cinnabarGreenBold

" Error messages on the command line
call s:HL('ErrorMsg', s:bright_white, s:red)
" More prompt: -- More --
hi! link MoreMsg cinnabarYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg cinnabarYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question cinnabarOrangeBold
" Warning messages
hi! link WarningMsg cinnabarRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:xgray5)

if g:cinnabar_transparent_background == 1 && !has('gui_running')
  " Column where signs are displayed
  " TODO Possibly need to fix  SignColumn
  call s:HL('SignColumn', s:none, s:none)
  " Line used for closed folds
  call s:HL('Folded', s:xgray5, s:none, s:italic)
  " Column where folds are displayed
  call s:HL('FoldColumn', s:bright_black, s:none)
else
  call s:HL('SignColumn', s:none, s:black)
  call s:HL('Folded', s:xgray5, s:black, s:italic)
  call s:HL('FoldColumn', s:xgray5, s:black)
endif

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:black, s:yellow)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

hi! link Special cinnabarOrange

call s:HL('Comment', s:xgray7, s:none, s:italic)

if g:cinnabar_transparent_background == 1 && !has('gui_running')
  call s:HL('Todo', s:bright_white, s:none, s:bold . s:italic)
else
  call s:HL('Todo', s:bright_white, s:black, s:bold . s:italic)
endif

call s:HL('Error', s:bright_white, s:red, s:bold)

" String constant: "this is a string"
call s:HL('String',  s:bright_green)

" Generic statement
hi! link Statement cinnabarRed
" if, then, else, endif, swicth, etc.
hi! link Conditional cinnabarRed
" for, do, while, etc.
hi! link Repeat cinnabarRed
" case, default, etc.
hi! link Label cinnabarRed
" try, catch, throw
hi! link Exception cinnabarRed
" sizeof, "+", "*", etc.
hi! link Operator cinnabarBrightYellow
" Any other keyword
hi! link Keyword cinnabarRed

" Variable name
hi! link Identifier Normal
" Function name
hi! link Function cinnabarCyan

" Generic preprocessor
hi! link PreProc cinnabarCyan
" Preprocessor #include
hi! link Include cinnabarCyan
" Preprocessor #define
hi! link Define cinnabarCyan
" Same as Define
hi! link Macro cinnabarOrange
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit cinnabarCyan

" Generic constant
hi! link Constant cinnabarBrightMagenta
" Character constant: 'c', '/n'
hi! link Character cinnabarBrightMagenta
" Boolean constant: TRUE, false
hi! link Boolean cinnabarBrightMagenta
" Number constant: 234, 0xff
hi! link Number cinnabarBrightMagenta
" Floating point constant: 2.3e10
hi! link Float cinnabarBrightMagenta

" Generic type
hi! link Type cinnabarBrightBlue
" static, register, volatile, etc
hi! link StorageClass cinnabarOrange
" struct, union, enum, etc.
hi! link Structure cinnabarCyan
" typedef
hi! link Typedef cinnabarMagenta

" punctuation
hi! link Delimiter cinnabarBrightWhite

" }}}
" Completion Menu: {{{

if v:version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:bright_white, s:xgray2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bright_white, s:magenta, s:bold)

  if g:cinnabar_transparent_background == 1 && !has('gui_running')
    " Popup menu: scrollbar
    call s:HL('PmenuSbar', s:none, s:none)
    " Popup menu: scrollbar thumb
    call s:HL('PmenuThumb', s:none, s:none)
  else
    call s:HL('PmenuSbar', s:none, s:black)
    call s:HL('PmenuThumb', s:none, s:black)
  endif
endif

" }}}
" Diffs: {{{

if g:cinnabar_transparent_background == 1 && !has('gui_running')
  call s:HL('DiffDelete', s:red, s:none)
  call s:HL('DiffAdd',    s:green, s:none)
  call s:HL('DiffChange', s:cyan, s:none)
  call s:HL('DiffText',   s:yellow, s:none)
else
  call s:HL('DiffDelete', s:red, s:black)
  call s:HL('DiffAdd',    s:green, s:black)
  call s:HL('DiffChange', s:cyan, s:black)
  call s:HL('DiffText',   s:yellow, s:black)
endif

" }}}
" Spelling: {{{

if has('spell')
  " Not capitalised word, or compile warnings
  call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:cyan)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:magenta)
endif

" }}}
" Terminal: {{{

if has('terminal')
  " Must set an explicit background as NONE won't work
  " Therefore not useful with transparent background option
  call s:HL('Terminal', s:bright_white, s:black)
endif

" }}}
" CtrlP: "{{{
hi! link CtrlPMatch cinnabarMagenta
hi! link CtrlPLinePre cinnabarBrightGreen
call s:HL('CtrlPMode1', s:bright_white, s:xgray3)
call s:HL('CtrlPMode2', s:bright_white, s:xgray5)
call s:HL('CtrlPStats', s:yellow, s:xgray2)
" }}}

" Plugin specific -------------------------------------------------------------
" Sneak: {{{

hi! link SneakPluginTarget Search
hi! link SneakStreakTarget Search
call s:HL('SneakStreakMask', s:yellow, s:yellow)
hi! link SneakStreakStatusLine Search

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue',  '#2C78BF'], ['202',  '#FF5F00'],
      \ ['red',  '#EF2F27'], ['magenta', '#E02C6D']
    \ ]
endif

let g:rainbow_guifgs = [ '#E02C6D', '#EF2F27', '#D75F00', '#2C78BF']
let g:rainbow_ctermfgs = [ 'magenta', 'red', '202', 'blue' ]

if !exists('g:rainbow_conf')
  let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
  let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
  let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd cinnabarGreen
hi! link GitGutterChange cinnabarYellow
hi! link GitGutterDelete cinnabarRed
hi! link GitGutterChangeDelete cinnabarYellow

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile cinnabarGreen
hi! link gitcommitDiscardedFile cinnabarRed

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign cinnabarRed
hi! link ALEWarningSign cinnabarYellow
hi! link ALEInfoSign cinnabarBlue

" }}}
" vim-indent-guides: {{{

call s:HL('IndentGuidesEven', s:none, s:xgray3)
call s:HL('IndentGuidesOdd',  s:none, s:xgray4)

" }}}
" vim-startify {{{

hi! link StartifyNumber Statement
hi! link StartifyFile Normal
hi! link StartifyPath String
hi! link StartifySlash Normal
hi! link StartifyBracket Comment
hi! link StartifyHeader Type
hi! link StartifyFooter Normal
hi! link StartifySpecial Comment
hi! link StartifySection Identifier

" }}}
" codi-vim {{{
hi! link CodiVirtualText String
hi! link CodiVirtualTextError Statement
hi! link CodiVirtualTextWarn Function
" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded cinnabarGreen
hi! link diffRemoved cinnabarRed
hi! link diffChanged cinnabarCyan

hi! link diffFile cinnabarOrange
hi! link diffNewFile cinnabarYellow

hi! link diffLine cinnabarBlue

" }}}
" Html: {{{

hi! link htmlTag cinnabarBlue
hi! link htmlEndTag cinnabarBlue

hi! link htmlTagName cinnabarBlue
hi! link htmlTag cinnabarBrightBlack
hi! link htmlArg cinnabarYellow

hi! link htmlScriptTag cinnabarRed
hi! link htmlTagN cinnabarBlue
hi! link htmlSpecialTagName cinnabarBlue

call s:HL('htmlLink', s:bright_white, s:none, s:underline)

hi! link htmlSpecialChar cinnabarYellow

if g:cinnabar_transparent_background == 1 && !has('gui_running')
  call s:HL('htmlBold', s:bright_white, s:none, s:bold)
  call s:HL('htmlBoldUnderline', s:bright_white, s:none, s:bold . s:underline)
  call s:HL('htmlBoldItalic', s:bright_white, s:none, s:bold . s:italic)
  call s:HL('htmlBoldUnderlineItalic', s:bright_white, s:none, s:bold . s:underline . s:italic)
  call s:HL('htmlUnderline', s:bright_white, s:none, s:underline)
  call s:HL('htmlUnderlineItalic', s:bright_white, s:none, s:underline . s:italic)
  call s:HL('htmlItalic', s:bright_white, s:none, s:italic)
else
  call s:HL('htmlBold', s:bright_white, s:black, s:bold)
  call s:HL('htmlBoldUnderline', s:bright_white, s:black, s:bold . s:underline)
  call s:HL('htmlBoldItalic', s:bright_white, s:black, s:bold . s:italic)
  call s:HL('htmlBoldUnderlineItalic', s:bright_white, s:black, s:bold . s:underline . s:italic)
  call s:HL('htmlUnderline', s:bright_white, s:black, s:underline)
  call s:HL('htmlUnderlineItalic', s:bright_white, s:black, s:underline . s:italic)
  call s:HL('htmlItalic', s:bright_white, s:black, s:italic)
endif


" }}}
" Xml: {{{

hi! link xmlTag cinnabarBlue
hi! link xmlEndTag cinnabarBlue
hi! link xmlTagName cinnabarBlue
hi! link xmlEqual cinnabarBlue
hi! link docbkKeyword cinnabarCyanBold

hi! link xmlDocTypeDecl cinnabarBrightBlack
hi! link xmlDocTypeKeyword cinnabarMagenta
hi! link xmlCdataStart cinnabarBrightBlack
hi! link xmlCdataCdata cinnabarMagenta
hi! link dtdFunction cinnabarBrightBlack
hi! link dtdTagName cinnabarMagenta

hi! link xmlAttrib cinnabarCyan
hi! link xmlProcessingDelim cinnabarBrightBlack
hi! link dtdParamEntityPunct cinnabarBrightBlack
hi! link dtdParamEntityDPunct cinnabarBrightBlack
hi! link xmlAttribPunct cinnabarBrightBlack

hi! link xmlEntity cinnabarYellow
hi! link xmlEntityPunct cinnabarYellow
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:bright_white, s:none, s:bold . s:italic)

hi! link vimNotation cinnabarYellow
hi! link vimBracket cinnabarYellow
hi! link vimMapModKey cinnabarYellow
hi! link vimFuncSID cinnabarBrightWhite
hi! link vimSetSep cinnabarBrightWhite
hi! link vimSep cinnabarBrightWhite
hi! link vimContinue cinnabarBrightWhite

" }}}
" Lisp dialects: {{{
hi! link clojureKeyword cinnabarBlue
hi! link clojureCond cinnabarRed
hi! link clojureSpecial cinnabarRed
hi! link clojureDefine cinnabarRed

hi! link clojureFunc cinnabarYellow
hi! link clojureRepeat cinnabarYellow
hi! link clojureCharacter cinnabarCyan
hi! link clojureStringEscape cinnabarCyan
hi! link clojureException cinnabarRed

hi! link clojureRegexp cinnabarCyan
hi! link clojureRegexpEscape cinnabarCyan
call s:HL('clojureRegexpCharClass', s:bright_white, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureAnonArg cinnabarYellow
hi! link clojureVariable cinnabarBlue
hi! link clojureMacro cinnabarOrangeBold

hi! link clojureMeta cinnabarYellow
hi! link clojureDeref cinnabarYellow
hi! link clojureQuote cinnabarYellow
hi! link clojureUnquote cinnabarYellow
" }}}
" C: {{{

hi! link cOperator cinnabarMagenta
hi! link cStructure cinnabarYellow

" }}}
" Python: {{{

hi! link pythonBuiltin cinnabarYellow
hi! link pythonBuiltinObj cinnabarYellow
hi! link pythonBuiltinFunc cinnabarYellow
hi! link pythonFunction cinnabarCyan
hi! link pythonDecorator cinnabarRed
hi! link pythonInclude cinnabarBlue
hi! link pythonImport cinnabarBlue
hi! link pythonRun cinnabarBlue
hi! link pythonCoding cinnabarBlue
hi! link pythonOperator cinnabarRed
hi! link pythonExceptions cinnabarMagenta
hi! link pythonBoolean cinnabarMagenta
hi! link pythonDot cinnabarBrightWhite

" }}}
" CSS/SASS: {{{

hi! link cssBraces cinnabarBrightWhite
hi! link cssFunctionName cinnabarYellow
hi! link cssIdentifier cinnabarBlue
hi! link cssClassName cinnabarBlue
hi! link cssClassNameDot cinnabarBlue
hi! link cssColor cinnabarBrightMagenta
hi! link cssSelectorOp cinnabarBlue
hi! link cssSelectorOp2 cinnabarBlue
hi! link cssImportant cinnabarGreen
hi! link cssVendor cinnabarBlue
hi! link cssMediaProp cinnabarYellow
hi! link cssBorderProp cinnabarYellow
hi! link cssAttrComma cinnabarBrightWhite

hi! link cssTextProp cinnabarYellow
hi! link cssAnimationProp cinnabarYellow
hi! link cssUIProp cinnabarYellow
hi! link cssTransformProp cinnabarYellow
hi! link cssTransitionProp cinnabarYellow
hi! link cssPrintProp cinnabarYellow
hi! link cssPositioningProp cinnabarYellow
hi! link cssBoxProp cinnabarYellow
hi! link cssFontDescriptorProp cinnabarYellow
hi! link cssFlexibleBoxProp cinnabarYellow
hi! link cssBorderOutlineProp cinnabarYellow
hi! link cssBackgroundProp cinnabarYellow
hi! link cssMarginProp cinnabarYellow
hi! link cssListProp cinnabarYellow
hi! link cssTableProp cinnabarYellow
hi! link cssFontProp cinnabarYellow
hi! link cssPaddingProp cinnabarYellow
hi! link cssDimensionProp cinnabarYellow
hi! link cssRenderProp cinnabarYellow
hi! link cssColorProp cinnabarYellow
hi! link cssGeneratedContentProp cinnabarYellow
hi! link cssTagName cinnabarBrightBlue

" SASS
hi! link sassClass cinnabarBlue
hi! link sassClassChar cinnabarBlue
hi! link sassVariable cinnabarCyan
hi! link sassIdChar cinnabarBrightBlue

" }}}
" JavaScript: {{{

hi! link javaScriptMember cinnabarBlue
hi! link javaScriptNull cinnabarMagenta

" }}}
" YAJS: {{{

hi! link javascriptParens cinnabarBrightCyan
hi! link javascriptFuncArg Normal
hi! link javascriptDocComment cinnabarGreen
hi! link javascriptArrayMethod Function
hi! link javascriptReflectMethod Function
hi! link javascriptStringMethod Function
hi! link javascriptObjectMethod Function
hi! link javascriptObjectStaticMethod Function
hi! link javascriptObjectLabel cinnabarBlue

hi! link javascriptProp cinnabarBlue

hi! link javascriptVariable cinnabarBrightBlue
hi! link javascriptOperator cinnabarBrightCyan
hi! link javascriptFuncKeyword cinnabarBrightRed
hi! link javascriptFunctionMethod cinnabarYellow
hi! link javascriptReturn cinnabarBrightRed
hi! link javascriptEndColons Normal

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp cinnabarBrightWhite
hi! link coffeeSpecialOp cinnabarBrightWhite
hi! link coffeeCurly cinnabarYellow
hi! link coffeeParen cinnabarBrightWhite
hi! link coffeeBracket cinnabarYellow

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter cinnabarGreen
hi! link rubyInterpolationDelimiter cinnabarCyan
hi! link rubyDefine Keyword

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier cinnabarRed
hi! link objcDirective cinnabarBlue

" }}}
" Go: {{{

hi! link goDirective cinnabarCyan
hi! link goConstants cinnabarMagenta
hi! link goDeclaration cinnabarRed
hi! link goDeclType cinnabarBlue
hi! link goBuiltins cinnabarYellow

" }}}
" Lua: {{{

hi! link luaIn cinnabarRed
hi! link luaFunction cinnabarCyan
hi! link luaTable cinnabarYellow

" }}}
" MoonScript: {{{

hi! link moonSpecialOp cinnabarBrightWhite
hi! link moonExtendedOp cinnabarBrightWhite
hi! link moonFunction cinnabarBrightWhite
hi! link moonObject cinnabarYellow

" }}}
" Java: {{{

hi! link javaAnnotation cinnabarBlue
hi! link javaDocTags cinnabarCyan
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen cinnabarBrightWhite
hi! link javaParen1 cinnabarBrightWhite
hi! link javaParen2 cinnabarBrightWhite
hi! link javaParen3 cinnabarBrightWhite
hi! link javaParen4 cinnabarBrightWhite
hi! link javaParen5 cinnabarBrightWhite
hi! link javaOperator cinnabarYellow

hi! link javaVarArg cinnabarGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter cinnabarGreen
hi! link elixirInterpolationDelimiter cinnabarCyan

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition cinnabarBlue
hi! link scalaCaseFollowing cinnabarBlue
hi! link scalaCapitalWord cinnabarBlue
hi! link scalaTypeExtension cinnabarBlue

hi! link scalaKeyword cinnabarRed
hi! link scalaKeywordModifier cinnabarRed

hi! link scalaSpecial cinnabarCyan
hi! link scalaOperator cinnabarBlue

hi! link scalaTypeDeclaration cinnabarYellow
hi! link scalaTypeTypePostDeclaration cinnabarYellow

hi! link scalaInstanceDeclaration cinnabarBlue
hi! link scalaInterpolation cinnabarCyan

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:bright_white, s:none, s:italic)

hi! link markdownH1 cinnabarGreenBold
hi! link markdownH2 cinnabarGreenBold
hi! link markdownH3 cinnabarYellowBold
hi! link markdownH4 cinnabarYellowBold
hi! link markdownH5 cinnabarYellow
hi! link markdownH6 cinnabarYellow

hi! link markdownCode cinnabarCyan
hi! link markdownCodeBlock cinnabarCyan
hi! link markdownCodeDelimiter cinnabarCyan

hi! link markdownBlockquote cinnabarBrightBlack
hi! link markdownListMarker cinnabarBrightBlack
hi! link markdownOrderedListMarker cinnabarBrightBlack
hi! link markdownRule cinnabarBrightBlack
hi! link markdownHeadingRule cinnabarBrightBlack

hi! link markdownUrlDelimiter cinnabarBrightWhite
hi! link markdownLinkDelimiter cinnabarBrightWhite
hi! link markdownLinkTextDelimiter cinnabarBrightWhite

hi! link markdownHeadingDelimiter cinnabarYellow
hi! link markdownUrl cinnabarMagenta
hi! link markdownUrlTitleDelimiter cinnabarGreen

call s:HL('markdownLinkText', s:bright_black, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType cinnabarYellow
" hi! link haskellOperators cinnabarYellow
" hi! link haskellConditional cinnabarCyan
" hi! link haskellLet cinnabarYellow
"
hi! link haskellType cinnabarBlue
hi! link haskellIdentifier cinnabarBlue
hi! link haskellSeparator cinnabarBlue
hi! link haskellDelimiter cinnabarBrightWhite
hi! link haskellOperators cinnabarBlue
"
hi! link haskellBacktick cinnabarYellow
hi! link haskellStatement cinnabarYellow
hi! link haskellConditional cinnabarYellow

hi! link haskellLet cinnabarCyan
hi! link haskellDefault cinnabarCyan
hi! link haskellWhere cinnabarCyan
hi! link haskellBottom cinnabarCyan
hi! link haskellBlockKeywords cinnabarCyan
hi! link haskellImportKeywords cinnabarCyan
hi! link haskellDeclKeyword cinnabarCyan
hi! link haskellDeriving cinnabarCyan
hi! link haskellAssocType cinnabarCyan

hi! link haskellNumber cinnabarMagenta
hi! link haskellPragma cinnabarMagenta

hi! link haskellString cinnabarGreen
hi! link haskellChar cinnabarGreen

" }}}
" Json: {{{

hi! link jsonKeyword cinnabarGreen
hi! link jsonQuote cinnabarGreen
hi! link jsonBraces cinnabarBlue
hi! link jsonString cinnabarBlue

" }}}
" Rust: {{{
"https://github.com/rust-lang/rust.vim/blob/master/syntax/rust.vim
hi! link rustCommentLineDoc cinnabarGreen
hi! link rustModPathSep cinnabarBrightBlack
" }}}
" Make: {{{
hi! link makePreCondit cinnabarRed
hi! link makeCommands cinnabarBrightWhite
hi! link makeTarget cinnabarYellow
" }}}
" Misc: {{{
call s:HL('shParenError', s:bright_white, s:bright_red)
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker :
