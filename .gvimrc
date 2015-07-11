
let s:is_windows = has('win32') || has('win64')

let s:is_mac = !s:is_windows && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')

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

    set guifont=Ricty:h10:cSHIFTJIS
    "set guifont=Consolas:h12,Lucida_Console:h12:w5 guifontwide=MS_Gothic:h12

elseif s:is_mac
    "--- Mac OS X ---

    "set guifont=Monaco:h12
    set guifont=Ricty Diminished:h10:cSHIFTJIS

else
    "--- Linux ---

    set guifont=Ricty\ 12
    "set guifont=Ubuntu\ Mono\ 12

    set lines=40 columns=120
endif

" Disable beep.
set vb t_vb=


set imdisable

