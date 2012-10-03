
colorscheme desert

if has('win32')
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim

    set guifont=Consolas:h10,Lucida_Console:h10:w5 guifontwide=MS_Gothic:h10
else
    set guifont=Ubuntu\ Mono\ 12
    set lines=40 columns=120
endif


"if has("gui_running")
"endif

