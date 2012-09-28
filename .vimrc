
set nocompatible

set nobackup

"Vundleの設定
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle "Shougo/vimproc"
Bundle "Shougo/vimshell"
Bundle "Shougo/unite.vim"
Bundle "Shougo/neocomplcache"

filetype plugin indent on

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

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

if !has('win32')
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
endif


" netrwは常にtree view
let g:netrw_liststyle = 3

" Dropbox
if has('win32')
    cd $HOME
    "cd $HOME\My Documents\Dropbox
else
    cd ~/Dropbox
endif

