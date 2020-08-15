" =============================================================================
" Filename: spaceline.vim
" Author: glepnir
" URL: https://github.com/glepnir/spaceline.vim
" License: MIT License
" =============================================================================

function! spaceline#colorscheme#space#space()
  let s:slc={}
  let s:slc.yellow = ['#cfad00', 3]
  let s:slc.navy = ['#242B38', 237]
  let s:slc.lightgray= ['#cccccc', 188]
  let s:slc.lightergray= ['#cccccc', 188]
  let s:slc.white= ['#f1f1ef', 15]
  let s:slc.purple = ['#88658d', 5]
  let s:slc.orange = ['#FF5F00', 202]
  let s:slc.red = ['#e04128', 1]
  let s:slc.blue = ['#417ab3', 4]
  let s:slc.lightblue = ['#83afd8', 12]
  let s:slc.teal = ['#008080', 6]
  let s:slc.green = ['#afd700', 2]
  let s:slc.gray = ['#3c3836', 237]
  let s:slc.aqua= ['#02aa91', 6]
  let s:slc.water= ['#02aa91', 6]
  let s:slc.darknavy=['#000000', 0]
  let s:slc.black=['#000000', 0]

  call spaceline#colors#match_background_color(s:slc.darknavy)
  
  call spaceline#colors#spaceline_hl('HomeAccent', s:slc, 'black', 'red')
  call spaceline#colors#spaceline_hl('HomeMode', s:slc, 'black', 'lightgray')
  call spaceline#colors#spaceline_hl('HomeModeRight',s:slc,  'black', 'lightgray')
  call spaceline#colors#spaceline_hl('FileNameRight',s:slc, 'gray','black')
  call spaceline#colors#spaceline_hl('FileSizeRight',s:slc, 'black','gray')
  call spaceline#colors#spaceline_hl('GitLeft',s:slc,  'navy',  'purple')
  call spaceline#colors#spaceline_hl('GitRight',s:slc,  'navy',  'purple')
  call spaceline#colors#spaceline_hl('InActiveHomeRight', s:slc, 'navy', 'yellow')
  call spaceline#colors#spaceline_hl('ShortRight', s:slc, 'navy', 'yellow')

  call spaceline#colors#spaceline_hl('InActiveFilename', s:slc, 'lightgray', 'navy')
  call spaceline#colors#spaceline_hl('FileName', s:slc, 'green', 'black','bold')
  call spaceline#colors#spaceline_hl('Filesize', s:slc, 'white', 'gray')
  call spaceline#colors#spaceline_hl('HeartSymbol', s:slc, 'orange',  'navy')
  call spaceline#colors#spaceline_hl('CocError',s:slc,  'red',  'navy')
  call spaceline#colors#spaceline_hl('CocWarn',s:slc,  'blue',  'navy')
  call spaceline#colors#spaceline_hl('GitBranchIcon',s:slc,  'orange',  'purple')
  call spaceline#colors#spaceline_hl('GitInfo',s:slc,  'lightgray',  'purple','bold')
  call spaceline#colors#spaceline_hl('GitAdd',s:slc,  'green',  'purple')
  call spaceline#colors#spaceline_hl('GitRemove',s:slc,  'red',  'purple')
  call spaceline#colors#spaceline_hl('GitModified',s:slc,  'orange',  'purple')
  call spaceline#colors#spaceline_hl('CocBar',s:slc,  'teal',  'darknavy')
  call spaceline#colors#spaceline_hl('VistaNearest',s:slc,  'teal',  'darknavy')
  
  if g:seperate_style ==? 'slant'
    call spaceline#colors#spaceline_hl('LineInfoLeft',s:slc,  'darknavy',  'purple')
  else
    call spaceline#colors#spaceline_hl('LineInfoLeft',s:slc,  'lightgray',  'darknavy')
  endif
  
  if g:seperate_style ==? 'arrow' || g:seperate_style ==? 'curve' || g:seperate_style ==? 'slant-fade'
    call spaceline#colors#spaceline_hl('LineFormatRight',s:slc,  'gray',  'lightgray')
  else
    call spaceline#colors#spaceline_hl('LineFormatRight',s:slc,  'gray',  'gray')
  endif

  call spaceline#colors#spaceline_hl('StatusEncod',s:slc,  'black',  'lightgray')
  call spaceline#colors#spaceline_hl('StatusFileFormat',s:slc,  'black',  'lightgray')
  call spaceline#colors#spaceline_hl('StatusLineinfo',s:slc,  'white',  'gray')
  call spaceline#colors#spaceline_hl('EndSeperate',s:slc,  'lightergray',  'gray')
  call spaceline#colors#spaceline_hl('emptySeperate1',s:slc,  'navy',  'darknavy')
endfunction
