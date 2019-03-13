" Name:       mangroove.vim
" Version:    0.0.1
" Maintainer: github.com/cinghiopinghio
" License:    GPL3
"
"""
hi clear

if exists('syntax on')
    syntax reset
endif

let g:colors_name='mangroove'

"{{{ Colorscheme settings

if !exists('g:mangroove_transparent_bg')
  let g:mangroove_transparent_bg=0
endif

if !exists('g:mangroove_accent_color')
  let g:mangroove_accent_color='green'
endif

if !exists('g:mangroove_secondary_color')
  let g:mangroove_secondary_color='purple'
endif

if !exists('g:mangroove_emphasis')
  let g:mangroove_emphasis=1
endif

"}}}

"{{{ setup palette dictionary
let s:gb = {}

let s:none = ['NONE', 'NONE']

" fill it with absolute colors
let s:gb.dark0_hard     = ['#1d2021', 234] " 29-32-33
let s:gb.dark0          = ['#282828', 235] " 40-40-40
let s:gb.dark0_soft     = ['#32302f', 236] " 50-48-47
let s:gb.dark1          = ['#3c3836', 237] " 60-56-54
let s:gb.dark2          = ['#504945', 239] " 80-73-69
let s:gb.dark3          = ['#665c54', 241] " 102-92-84
let s:gb.dark4          = ['#7c6f64', 243] " 124-111-100
let s:gb.dark4_256      = ['#7c6f64', 243] " 124-111-100

let s:gb.gray_245       = ['#928374', 245] " 146-131-116
let s:gb.gray_244       = ['#928374', 244] " 146-131-116

let s:gb.light0_hard    = ['#f9f5d7', 230] " 249-245-215
let s:gb.light0         = ['#fbf1c7', 229] " 253-244-193
let s:gb.light0_soft    = ['#f2e5bc', 228] " 242-229-188
let s:gb.light1         = ['#ebdbb2', 223] " 235-219-178
let s:gb.light2         = ['#d5c4a1', 250] " 213-196-161
let s:gb.light3         = ['#bdae93', 248] " 189-174-147
let s:gb.light4         = ['#a89984', 246] " 168-153-132
let s:gb.light4_256     = ['#a89984', 246] " 168-153-132

let s:gb.bright_red     = ['#fb4934', 167] " 251-73-52
let s:gb.bright_green   = ['#b8bb26', 142] " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214] " 250-189-47
let s:gb.bright_blue    = ['#83a598', 109] " 131-165-152
let s:gb.bright_purple  = ['#d3869b', 175] " 211-134-155
let s:gb.bright_aqua    = ['#8ec07c', 108] " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208] " 254-128-25

let s:gb.neutral_red    = ['#cc241d', 124] " 204-36-29
let s:gb.neutral_green  = ['#98971a', 106] " 152-151-26
let s:gb.neutral_yellow = ['#d79921', 172] " 215-153-33
let s:gb.neutral_blue   = ['#458588', 66]  " 69-133-136
let s:gb.neutral_purple = ['#b16286', 132] " 177-98-134
let s:gb.neutral_aqua   = ['#689d6a', 72]  " 104-157-106
let s:gb.neutral_orange = ['#d65d0e', 166] " 214-93-14

let s:gb.faded_red      = ['#9d0006', 88]  " 157-0-6
let s:gb.faded_green    = ['#79740e', 100] " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136] " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]  " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]  " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]  " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130] " 175-58-3
"}}}

let s:background = &background

"{{{ Set colors if bg is dark or light
let s:mg = {}

if   &background == "dark"

  if g:mangroove_transparent_bg
    let s:mg.bg = s:none
  else
    let s:mg.bg  = s:gb.dark0
  endif
  let s:mg.fg  = s:gb.light0
  for shade in ['0', '1', '2', '3', '4']
    let s:mg['bg' . shade] = s:gb['dark' . shade]
    let s:mg['fg' . shade] = s:gb['light' . shade]
  endfor

  let s:mg.gray = s:gb.gray_244

  for lcol in ['red', 'green', 'yellow', 'blue', 'purple', 'aqua', 'orange']
    let s:mg[lcol . '_bg'] = s:gb['faded_' . lcol]
    let s:mg[lcol . '_fg'] = s:gb['bright_' . lcol]
    let s:mg[lcol . '_nn'] = s:gb['neutral_' . lcol]
  endfor

  let s:mg.accent_bg = s:gb['faded_' . g:mangroove_accent_color]
  let s:mg.accent_fg = s:gb['bright_' . g:mangroove_accent_color]
  let s:mg.accent_nn = s:gb['neutral_' . g:mangroove_accent_color]
  let s:mg.secondary_bg = s:gb['faded_' . g:mangroove_secondary_color]
  let s:mg.secondary_fg = s:gb['bright_' . g:mangroove_secondary_color]
  let s:mg.secondary_nn = s:gb['neutral_' . g:mangroove_secondary_color]
else
  if g:mangroove_transparent_bg
    let s:mg.bg = s:none
  else
    let s:mg.bg  = s:gb.light0
  endif
  let s:mg.fg  = s:gb.dark0
  for shade in ['0', '1', '2', '3', '4']
    let s:mg['bg' . shade] = s:gb['light' . shade]
    let s:mg['fg' . shade] = s:gb['dark' . shade]
  endfor

  let s:mg.gray = s:gb.gray_244

  for lcol in ['red', 'green', 'yellow', 'blue', 'purple', 'aqua', 'orange']
    let s:mg[lcol . '_fg'] = s:gb['faded_' . lcol]
    let s:mg[lcol . '_bg'] = s:gb['bright_' . lcol]
    let s:mg[lcol . '_nn'] = s:gb['neutral_' . lcol]
  endfor

  let s:mg.accent_fg = s:gb['faded_' . g:mangroove_accent_color]
  let s:mg.accent_bg = s:gb['bright_' . g:mangroove_accent_color]
  let s:mg.accent_nn = s:gb['neutral_' . g:mangroove_accent_color]
  let s:mg.secondary_fg = s:gb['faded_' . g:mangroove_secondary_color]
  let s:mg.secondary_bg = s:gb['bright_' . g:mangroove_secondary_color]
  let s:mg.secondary_nn = s:gb['neutral_' . g:mangroove_secondary_color]
endif

let s:mg.italic = ['italic', 'italic', 'italic']
let s:mg.bold = ['bold', 'bold', 'bold']

if g:mangroove_transparent_bg
  let s:mg.bg = s:none
endif

"}}}

" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0  = s:mg.bg[0]
  let g:terminal_color_8  = s:mg.bg1[0]

  let g:terminal_color_1  = s:mg.red_nn[0]
  let g:terminal_color_9  = s:mg.red_fg[0]

  let g:terminal_color_2  = s:mg.green_nn[0]
  let g:terminal_color_10 = s:mg.green_fg[0]

  let g:terminal_color_3  = s:mg.yellow_nn[0]
  let g:terminal_color_11 = s:mg.yellow_fg[0]

  let g:terminal_color_4  = s:mg.blue_nn[0]
  let g:terminal_color_12 = s:mg.blue_fg[0]

  let g:terminal_color_5  = s:mg.purple_nn[0]
  let g:terminal_color_13 = s:mg.purple_fg[0]

  let g:terminal_color_6  = s:mg.aqua_nn[0]
  let g:terminal_color_14 = s:mg.aqua_fg[0]

  let g:terminal_color_7  = s:mg.fg1[0]
  let g:terminal_color_15 = s:mg.fg[0]
endif

" }}}

" Highlighting Function: {{{

function! s:hl(group, ...)
  " Arguments: group, fg, bg, emphasis (gui, cterm), guisp

  let histring = [ 'hi', a:group]

  " foreground
  if a:0 >= 1
    if type(a:1) == v:t_list
      call extend(histring, ['guifg=' . a:1[0], 'ctermfg=' . a:1[1]])
    elseif a:1 == 'none'
      call extend(histring, ['guifg=NONE', 'ctermfg=NONE'])
    endif
  endif

  " background
  if a:0 >= 2
    if type(a:2) == v:t_list
      call extend(histring, ['guibg=' . a:2[0], 'ctermbg=' . a:2[1]])
    elseif a:2 == 'none'
      call extend(histring, ['gui bg=NONE', 'ctermbg=NONE'])
    endif
  endif

  " emphasis
  if a:0 >= 3 && strlen(a:3) && g:mangroove_emphasis
    call extend(histring, ['gui=' . a:3, 'cterm=' . a:3])
  else
    call extend(histring, ['gui=NONE', 'cterm=NONE'])
  endif

  " special
  if a:0 >= 4
    call add(histring, 'guisp=' . a:4[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}

" https://github.com/noahfrederick/vim-hemisu/
function! s:high(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg[0]   : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg[1]   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg[0]   : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg[1]   : "NONE")
    \ "gui="     (has_key(a:style, "attr")  ? a:style.attr[0] : "NONE")
    \ "cterm="   (has_key(a:style, "attr")  ? a:style.attr[1] : "NONE")
    \ "term="    (has_key(a:style, "attr")  ? a:style.attr[2] : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp[0]   : "NONE")
endfunction

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
    \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:hl('Normal',       s:mg.fg, s:mg.bg)
hi! link Identifier       Normal
hi! link Function         Identifier

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
   execute "set background=" . s:background
 endif

call s:hl('Comment',      s:mg.gray, "", 'italic')

call s:hl('Constant',     s:mg.accent_fg)
hi! link Character        Constant
hi! link Number           Constant
hi! link Boolean          Constant
hi! link Float            Constant
hi! link String           Constant

call s:hl("Operator",     s:mg.fg, "", 'bold')

call s:hl("Statement",    s:mg.fg4)
hi! link Conditonal       Statement
hi! link Repeat           Statement
hi! link Label            Statement
hi! link Keyword          Statement
hi! link Exception        Statement

call s:hl("PreProc",      s:mg.fg4)
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:hl("Type",         s:mg.fg)
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:hl("Special",      s:mg.accent_nn, "", "italic")
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

" user defined colors for statusline
" call s:hl('User1',        s:mg.fg,           s:mg.bg1)
" call s:hl('User2',        s:mg.fg4,          s:mg.bg1)
" call s:hl('User3',        s:mg.red_fg,       s:mg.bg1)
" call s:hl('User4',        s:mg.accent_fg,    s:mg.bg1)
" call s:hl('User5',        s:mg.yellow_fg,    s:mg.bg1)

call s:hl("DiffChange",   "",                s:mg.bg4)
call s:hl("DiffAdd",      "",                s:mg.accent_bg)
call s:hl("DiffDelete",   "",                s:mg.fg)
call s:hl("DiffText",     "",                s:mg.secondary_bg)

call s:hl("Directory",    s:mg.blue_fg)

call s:hl("Error",        s:mg.red_fg,       s:mg.bg, "bold")
call s:hl("ErrorMsg",     s:mg.red_fg,       s:mg.bg)
call s:hl("Warning",      s:mg.yellow_fg,    s:mg.bg, "bold")
call s:hl("WarningMsg",   s:mg.yellow_fg,    s:mg.bg)
call s:hl("MoreMsg",      s:mg.bg4,          s:mg.bg, "bold")
hi! link Question ErrorMsg

call s:hl("FoldColumn",   s:mg.gray,          s:mg.bg1)
hi! link Folded FoldColumn

call s:hl("Cursor",       s:mg.fg,           s:mg.secondary_bg)
call s:hl("CursorLineNr", s:mg.secondary_fg, s:mg.bg1)
call s:hl("CursorColumn", "",                s:mg.bg1)
call s:hl("LineNr",       s:mg.fg4,          s:mg.bg1)
hi! link CursorLine CursorColumn
hi! link StatusLine CursorColumn
hi! link StatusLineNC LineNr
hi! link SignColumn LineNr
"call s:h("StatusLine",    {"bg": s:bg_very_subtle})
"call s:h("StatusLineNC",  {"bg": s:bg_very_subtle, "fg": s:bg_subtle})

call s:hl("NonText",      s:mg.bg4)

call s:hl("Ignore",       s:mg.bg)
call s:hl("IncSearch",    s:mg.bg, s:mg.secondary_fg)
call s:hl("Search",       s:mg.bg1, s:mg.accent_fg)
call s:hl("Todo",         s:mg.secondary_fg, s:mg.bg, "underline")
call s:hl("VertSplit",    s:mg.bg1, s:mg.bg1)
call s:hl("Visual",       s:mg.fg, s:mg.secondary_bg)
call s:hl("VisualNOS",    "", s:mg.bg4)
" TODO
"
" from here, downward, copied as is!
"
" RECHECK

hi! link SpecialKey SignColumn
call s:hl("Title",        s:mg.blue_fg)
call s:hl("Underlined",   "", "", "underline")
call s:hl("WildMenu",     s:mg.bg0, s:mg.fg)
hi! link ModeMsg MoreMsg


call s:hl("SpellBad",     s:mg.red_fg, "", "underline")
call s:hl("SpellCap",     s:mg.secondary_fg, "", "underline")
hi! link SpellRare SpellBad
hi! link SpellLocal SpellCap

call s:hl("Pmenu",        s:mg.fg, s:mg.bg2)
call s:hl("PmenuSel",     s:mg.fg, s:mg.secondary_bg)
call s:hl("PmenuSbar",    s:mg.fg, s:mg.bg3)
hi! link PmenuThumb PmenuSbar
call s:hl("TabLine",      s:mg.fg, s:mg.bg1)
call s:hl("TabLineSel",   s:mg.accent_fg, s:mg.bg3, "bold")
call s:hl("TabLineFill",  s:mg.fg, s:mg.bg2)
call s:hl("ColorColumn",  "", s:mg.bg1)

call s:hl("MatchParen",   "", s:mg.bg2)

hi! link htmlH1 Normal
hi! link htmlH2 Normal
hi! link htmlH3 Normal
hi! link htmlH4 Normal
hi! link htmlH5 Normal
hi! link htmlH6 Normal

" Synatastic
hi! link SyntasticError Error
hi! link SyntasticErrorSign ErrorMsg
hi! link SyntasticWarning Warning
hi! link SyntasticWarningSign WarningMsg

" Neomake
hi link NeomakeWarningSign      WarningMsg
hi link NeomakeErrorSign        ErrorMsg

" ALE
call s:hl("ALEWarningSign", s:mg.yellow_fg,    s:mg.bg1)
call s:hl("ALEErrorSign",   s:mg.red_fg,    s:mg.bg1)
" hi link ALEWarningSign  WarningMsg
" hi link ALEErrorSign    ErrorMsg

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
hi link GitGutterAdd                LineNr
hi link GitGutterDelete             LineNr
hi link GitGutterChange             LineNr
hi link GitGutterChangeDelete       LineNr

" Python
call s:hl("Python",        s:mg.fg4, "", "italic")
hi! link pythonBuiltin     Constant
hi! link pythonBuiltinObj  Python
hi! link pythonBuiltinFunc Python
hi! link pythonFunction    Normal
hi! link pythonStatement   Python
hi! link pythonDecorator   Python
hi! link pythonInclude     Python
hi! link pythonImport      Python
hi! link pythonRun         Python
hi! link pythonCoding      Python
hi! link pythonOperator    Python
hi! link pythonException   Python
hi! link pythonExceptions  Python
hi! link pythonBoolean     Python
hi! link pythonDot         Python
hi! link pythonConditional Python
hi! link pythonRepeat      Python
hi! link pythonDottedName  Python

" Vimtex
call s:hl("Tex",          s:mg.fg4, "", "italic")
hi! link texSection Tex
hi! link texStatement Tex
hi! link texBeginEnd Tex
