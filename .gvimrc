
colorscheme jellybeans
set guioptions-=T
set guioptions-=m
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r

if has('win32')
    " Kaoriya Vimを想定

    " UTF-8 モード
    source $VIMRUNTIME/delmenu.vim
    set langmenu=ja_jp.utf-8
    source $VIMRUNTIME/menu.vim

    set guifont=Ricty:h12
    "set guifont=Consolas:h12,Lucida_Console:h12:w5 guifontwide=MS_Gothic:h12

    " IM
    " 「日本語入力固定モード」の動作モード
    "let IM_CtrlMode = 4
    " 「日本語入力固定モード」切替キー
    "inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>
else
    set guifont=Ricty\ 12
    "set guifont=Ubuntu\ Mono\ 12
    set lines=40 columns=120

    " IM
    " 「日本語入力固定モード」切替キー
    "inoremap <silent> <C-j> <C-r>=IMState('FixMode')<CR>
    " PythonによるIBus制御指定
    "let IM_CtrlIBusPython = 1

    " <ESC>押下後のIM切替開始までの反応が遅い場合はttimeoutlenを短く設定してみてください。
    "set timeout timeoutlen=3000 ttimeoutlen=100
endif

