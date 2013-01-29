
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

