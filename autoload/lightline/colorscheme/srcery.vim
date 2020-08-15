" -----------------------------------------------------------------------------
" File: cinnabar.vim
" Description: Cinnabar colorscheme for Lightline (itchyny/lightline.vim)
" Author: Roosta <mail@roosta>
" Source: https://github.com/morhetz/gruvbox/blob/master/autoload/lightline/colorscheme/gruvbox.vim
" Last Modified: 2017-03-28
" -----------------------------------------------------------------------------

function! s:getSrcColor(group) abort
  let l:guiColor = synIDattr(hlID(a:group), 'fg', 'gui')
  let l:termColor = synIDattr(hlID(a:group), 'fg', 'cterm')
  return [ l:guiColor, l:termColor ]
endfunction

if exists('g:lightline')

  let s:black        = s:getSrcColor('CinnabarBlack')
  let s:bright_white = s:getSrcColor('CinnabarBrightWhite')
  let s:bright_black = s:getSrcColor('CinnabarBrightBlack')
  let s:white        = s:getSrcColor('CinnabarWhite')
  let s:yellow       = s:getSrcColor('CinnabarYellow')
  let s:blue         = s:getSrcColor('CinnabarBlue')
  let s:bright_blue  = s:getSrcColor('CinnabarBrightBlue')
  let s:cyan         = s:getSrcColor('CinnabarCyan')
  let s:bright_cyan  = s:getSrcColor('CinnabarBrightCyan')
  let s:red          = s:getSrcColor('CinnabarRed')
  let s:bright_red   = s:getSrcColor('CinnabarBrightRed')
  let s:orange       = s:getSrcColor('CinnabarOrange')
  let s:magenta      = s:getSrcColor('CinnabarMagenta')
  let s:green        = s:getSrcColor('CinnabarGreen')
  let s:bright_green = s:getSrcColor('CinnabarBrightGreen')
  let s:xgray1       = s:getSrcColor('CinnabarXgray1')
  let s:xgray2       = s:getSrcColor('CinnabarXgray2')
  let s:xgray3       = s:getSrcColor('CinnabarXgray3')
  let s:xgray4       = s:getSrcColor('CinnabarXgray4')
  let s:xgray5       = s:getSrcColor('CinnabarXgray5')
  let s:xgray6       = s:getSrcColor('CinnabarXgray6')

  let s:p = {'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 'visual':{}, 'tabline':{}, 'terminal':{}, 'command':{}}
  let s:p.normal.left     = [ [ s:bright_white, s:xgray5 ], [ s:bright_white, s:xgray3 ] ]
  let s:p.normal.right    = [ [ s:bright_white, s:xgray5 ], [ s:bright_white, s:xgray3 ] ]
  let s:p.normal.middle   = [ [ s:bright_white, s:xgray2 ] ]
  let s:p.inactive.right  = [ [ s:bright_black, s:xgray2 ], [ s:bright_black, s:xgray2 ] ]
  let s:p.inactive.left   = [ [ s:bright_black, s:xgray2 ], [ s:bright_black, s:xgray2 ] ]
  let s:p.inactive.middle = [ [ s:xgray6, s:xgray2 ] ]
  let s:p.insert.left     = [ [ s:black, s:bright_white ], [ s:black, s:bright_black ] ]
  let s:p.insert.right    = [ [ s:black, s:bright_white ], [ s:black, s:bright_black ] ]
  let s:p.insert.middle   = [ [ s:bright_white, s:xgray2 ] ]
  let s:p.replace.left    = [ [ s:bright_white, s:bright_red ], [ s:black, s:bright_black ] ]
  let s:p.replace.right   = [ [ s:bright_white, s:bright_red ], [ s:black, s:bright_black ] ]
  let s:p.replace.middle  = [ [ s:bright_white, s:xgray2 ] ]
  let s:p.visual.left     = [ [ s:black, s:cyan ], [ s:bright_white, s:xgray5 ] ]
  let s:p.visual.right    = [ [ s:black, s:cyan ], [ s:bright_white, s:xgray5 ] ]
  let s:p.visual.middle   = [ [ s:bright_white, s:xgray2 ] ]
  let s:p.tabline.left    = [ [ s:bright_white, s:xgray2 ] ]
  let s:p.tabline.tabsel  = [ [ s:black, s:bright_black ] ]
  let s:p.tabline.middle  = [ [ s:black, s:xgray2 ] ]
  let s:p.tabline.right   = [ [ s:black, s:bright_white ] ]
  let s:p.normal.error    = [ [ s:bright_white, s:red ] ]
  let s:p.normal.warning  = [ [ s:black, s:orange ] ]
  let s:p.terminal.left   = [ [ s:black, s:green ], [ s:bright_white, s:xgray5 ] ]
  let s:p.terminal.right  = [ [ s:black, s:green ], [ s:bright_white, s:xgray5 ] ]
  let s:p.terminal.middle = [ [ s:bright_white, s:xgray2 ] ]
  let s:p.command.left    = [ [ s:black, s:yellow ], [ s:bright_white, s:xgray5 ] ]
  let s:p.command.right   = [ [ s:black, s:yellow ], [ s:bright_white, s:xgray5 ] ]
  let s:p.command.middle  = [ [ s:bright_white, s:xgray2 ] ]

  let g:lightline#colorscheme#cinnabar#palette = lightline#colorscheme#flatten(s:p)
endif
