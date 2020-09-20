" vim-airline-cinnabar theme
" vim: expandtab shiftwidth=2 tabstop=2 :

" Color Palette {{{

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


" Theme Initializing {{{
let g:airline#themes#cinnabar#palette = {}
let s:modified = { 'airline_c': [ s:orange[0] , '' , s:orange[1] , '' , '' ] }

" }}}


" Mode Config {{{

" Command Mode
let s:c1 = [ s:black[0]        , s:bright_white[0] , s:black[1]        , s:bright_white[1] ]
let s:c2 = [ s:bright_white[0] , s:xgray3[0]       , s:bright_white[1] , s:xgray3[1]       ]
let s:c3 = [ s:bright_white[0] , s:xgray1[0] , s:bright_white[1] , s:xgray1[1] ]
let g:airline#themes#cinnabar#palette.commandline = airline#themes#generate_color_map(s:c1, s:c2, s:c3)
let g:airline#themes#cinnabar#palette.commandline_modified = s:modified
let g:airline#themes#cinnabar#palette.commandline_paste = s:modified

" Normal Mode
let s:n1 = [ s:bright_white[0] , s:xgray4[0]       , s:bright_white[1] , s:xgray4[1]       ]
let s:n2 = [ s:bright_white[0] , s:xgray3[0]       , s:bright_white[1] , s:xgray3[1]       ]
let s:n3 = [ s:bright_white[0] , s:xgray1[0] , s:bright_white[1] , s:xgray1[1] ]
let g:airline#themes#cinnabar#palette.normal = airline#themes#generate_color_map(s:n1, s:n2, s:n3)
let g:airline#themes#cinnabar#palette.normal_modified = s:modified
let g:airline#themes#cinnabar#palette.normal_paste = s:modified

" Inactive Mode
let s:in1 = [ s:xgray6[0] , s:xgray4[0] , s:bright_black[1] , s:xgray4[1] ]
let s:in2 = [ s:xgray6[0] , s:xgray3[0] , s:bright_black[1] , s:xgray3[1] ]
let s:in3 = [ s:xgray6[0] , s:xgray2[0] , s:bright_black[1] , s:xgray2[1] ]
let g:airline#themes#cinnabar#palette.inactive = airline#themes#generate_color_map(s:in1, s:in2, s:in3)
let g:airline#themes#cinnabar#palette.inactive_modified = s:modified

" Insert Mode
let s:i1 = [ s:black[0]        , s:bright_white[0] , s:black[1]        , s:bright_white[1] ]
let s:i2 = [ s:black[0]        , s:bright_black[0]        , s:black[1]        , s:bright_black[1]        ]
let s:i3 = [ s:bright_white[0] , s:xgray1[0] , s:bright_white[1] , s:xgray1[1] ]
let g:airline#themes#cinnabar#palette.insert = airline#themes#generate_color_map(s:i1, s:i2, s:i3)
let g:airline#themes#cinnabar#palette.insert_modified = s:modified

" Replace Mode
let s:r1  = [ s:bright_white[0] , s:bright_red[0]   , s:bright_white[1] , s:bright_red[1]   ]
let s:r2  = [ s:black[0]        , s:bright_black[0]        , s:black[1]        , s:bright_black[1]        ]
let s:r3  = [ s:bright_white[0] , s:xgray1[0] , s:bright_white[1] , s:xgray1[1] ]
let g:airline#themes#cinnabar#palette.replace = airline#themes#generate_color_map(s:r1, s:r2, s:r3)
let g:airline#themes#cinnabar#palette.replace_modified = s:modified

" Terminal Mode
let s:t1 = [ s:black[0]        , s:yellow[0]       , s:black[1]        , s:yellow[1]       ]
let s:t2 = [ s:bright_white[0] , s:xgray3[0]       , s:bright_white[1] , s:xgray3[1]       ]
let s:t3 = [ s:bright_white[0] , s:xgray1[0] , s:bright_white[1] , s:xgray1[1] ]
let g:airline#themes#cinnabar#palette.terminal = airline#themes#generate_color_map(s:t1, s:t2, s:t3)
let g:airline#themes#cinnabar#palette.terminal.airline_term = s:t3

" Visual Mode
let s:v1  = [ s:black[0]        , s:cyan[0]         , s:black[1]        , s:cyan[1]         ]
let s:v2  = [ s:bright_white[0] , s:xgray5[0]       , s:bright_white[1] , s:xgray5[1]       ]
let s:v3  = [ s:bright_white[0] , s:xgray1[0] , s:bright_white[1] , s:xgray1[1] ]
let g:airline#themes#cinnabar#palette.visual = airline#themes#generate_color_map(s:v1, s:v2, s:v3)
let g:airline#themes#cinnabar#palette.visual_modified = s:modified

" }}}


" Plugin Settings {{{

" ctrlp.vim
if get(g:, 'loaded_ctrlp', 0)
  let s:cp1 = [ s:bright_white[0] , s:xgray2[0] , s:bright_white[1] , s:xgray2[1] ]
  let s:cp2 = [ s:bright_white[0] , s:xgray5[0] , s:bright_white[1] , s:xgray5[1] ]
  let s:cp3 = [ s:bright_white[0] , s:xgray3[0] , s:bright_white[1] , s:xgray3[1] ]

  let g:airline#themes#cinnabar#palette.ctrlp = airline#extensions#ctrlp#generate_color_map(s:cp1, s:cp2, s:cp3)
endif

" }}}
