
let s:is_windows = has('win32') || has('win64')

let s:is_mac = !s:is_windows && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')


let g:jellybeans_background_color = "000000"

if !exists("g:jellybeans_use_lowcolor_black") || g:jellybeans_use_lowcolor_black
    let s:termBlack = "Black"
else
    let s:termBlack = "Grey"
endif

let g:jellybeans_overrides = {
\    "TabLine" : {'guifg': '000000', 'guibg': 'b0b8c0',
\                 'attr': '',
\                 'ctermfg': '', 'ctermbg': s:termBlack,
\                  },
\    "TabLineSel" : {'guifg': '000000', 'guibg': 'f0f0f0',
\                 'attr': 'bold',
\                 'ctermfg': '', 'ctermbg': s:termBlack,
\                  },
\    "Comment" : {'guifg': '888888', 'guibg': '',
\                 'attr': '',
\                 'ctermfg': 'Grey', 'ctermbg': '',
\                  },
\    "StatusLine" : {'guifg': '000000', 'guibg': 'dddddd',
\                 'attr': '',
\                 'ctermfg': '', 'ctermbg': 'White',
\                  },
\    "StatusLineNC" : {'guifg': 'ffffff', 'guibg': '403c41',
\                 'attr': '',
\                 'ctermfg': 'White', 'ctermbg': 'Black',
\                  },
\    "StatusLineFile" : {'guifg': 'ffffff', 'guibg': '',
\                 'attr': '',
\                 'ctermfg': 'White', 'ctermbg': 'Black',
\                  },
\    "Folded" : {'guifg': 'a0a8b0', 'guibg': '384048',
\                 'attr': '',
\                 'ctermfg': s:termBlack, 'ctermbg': '',
\                  },
\}

colorscheme jellybeans
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r

if s:is_windows
    " --- Windows ---
    " Kaoriya Vimを想定

    " UTF-8 モード
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim

    set guifont=Ricty:h12
    "set guifont=Consolas:h12,Lucida_Console:h12:w5 guifontwide=MS_Gothic:h12

elseif s:is_mac
    "--- Mac OS X ---

    set guifont=Monaco:h12

else
    "--- Linux ---

    set guifont=Ricty\ 12
    "set guifont=Ubuntu\ Mono\ 12

    set lines=40 columns=120
endif

" Disable beep.
set vb t_vb=

