" *** .vimrc for meryngii ***

" iMproved!
set nocompatible

let s:is_windows = has('win32') || has('win64')

" swap & backup
set swapfile
set directory=~/.vim/swp
set backup
set backupdir=~/.vim/backup

" NeoBundle's configuration
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" General
NeoBundle "Shougo/vimproc"
NeoBundle "Shougo/vimshell"
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/vimfiler"
" Completion
NeoBundle "Shougo/neocomplcache"
NeoBundle 'Shougo/neocomplcache-snippets-complete'
"NeoBundle 'taichouchou2/vim-rsense'
" Text
NeoBundle 'Align'
NeoBundle 'surround.vim'
" Comment
NeoBundle 'tomtom/tcomment_vim'
" Other
NeoBundle 'thinca/vim-fontzoom'

NeoBundle 'surround.vim'

" IM
NeoBundle "fuenor/im_control.vim"

filetype plugin indent on

" vimfiler
let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_edit_action = 'tabopen'
nnoremap <F2> :VimFiler -buffer-name=explorer -no-quit<Cr>

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

"imap <C-F>     <Plug>(neocomplcache_snippets_expand)
"smap <C-F>     <Plug>(neocomplcache_snippets_expand)
"imap <C-U>     <Esc>:Unite snippet<CR>

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()


" Align
let g:Align_xstrlen = 3


set tabstop=4
"tabが押されたときに実際に挿入される空白の文字数
set softtabstop=4
"オートインデント時に挿入される空白文字数
set shiftwidth=4
"tabの代わりに半角スペースを挿入する

set autoindent
set expandtab

" enable incremental search
set incsearch
" enable hilighting
set hlsearch



"set wildmode=list,full
"When more than one match, list all matches and complete first match.

set wildmenu
set wildmode=list:longest,full

set number
"set cmdheight=3

if has('win32') && !has('gui_running')
    set encoding=cp932
else
    set encoding=utf-8
endif

set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" netrwは常にtree view
let g:netrw_liststyle = 3

" Dropbox
if s:is_windows
    cd $HOME
    "cd $HOME\My Documents\Dropbox
else
    cd ~/Dropbox
endif

