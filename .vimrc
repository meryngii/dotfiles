set nocompatible

colorscheme desert

set guifont=Ubuntu\ Mono\ 11

set tabstop=4
"tabが押されたときに実際に挿入される空白の文字数
set softtabstop=4
"オートインデント時に挿入される空白文字数
set shiftwidth=4
"tabの代わりに半角スペースを挿入する

set autoindent
set expandtab

"set wildmode=list,full
"When more than one match, list all matches and complete first match.

set wildmenu
set wildmode=list:longest,full

set number
"set cmdheight=3

set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

if has("gui_running")
  set lines=40 columns=120
endif

" netrwは常にtree view
let g:netrw_liststyle = 3

" Dropbox
cd ~/Dropbox

