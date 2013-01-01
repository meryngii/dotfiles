" *** .vimrc for meryngii ***

" iMproved!
set nocompatible

let s:is_windows = has('win32') || has('win64')

let s:is_mac = !s:is_windows && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')



" swap & backup
set swapfile
set directory=~/.vim/swp
set backup
set backupdir=~/.vim/backup

" NeoBundle's configuration starts
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))


" Thanks to Shougo-san
NeoBundle "Shougo/vimproc"
NeoBundle "Shougo/vimshell"
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/vimfiler"
" (Completion)
NeoBundle "Shougo/neocomplcache"
NeoBundle 'Shougo/neosnippet'

" File
NeoBundle "sudo.vim"
" Text
NeoBundle "fuenor/im_control.vim"
NeoBundle 'Align'
NeoBundle 'surround.vim'
" Comment
NeoBundle 'tomtom/tcomment_vim'
" View
NeoBundle 'thinca/vim-fontzoom'
" Color theme
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'tomasr/molokai'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'jeffreyiacono/vim-colors-wombat'

NeoBundle 'ujihisa/unite-colorscheme'

" Powerline
NeoBundleLazy 'Lokaltog/powerline'
NeoBundle 'tpope/vim-fugitive'


filetype plugin on
filetype plugin indent off
" NeoBundle's configuration ends


" VimFiler
let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_edit_action = 'tabopen'
nnoremap <F2> :VimFiler -buffer-name=explorer -no-quit<Cr>


" Align
let g:Align_xstrlen = 3

" VimShell
nnoremap <C-x> :VimShell -split<cr>

let g:vimshell_right_prompt = 'getcwd()'

"--- Key Bindings ---
nnoremap <C-left> :vertical resize -5<cr>
nnoremap <C-right> :vertical resize +5<cr>
nnoremap <C-down> :resize +2<cr>
nnoremap <C-up> :resize -2<cr>

" Ctrl+s: Reload .vimrc & .gvimrc
nnoremap <C-s> :source $MYVIMRC<cr>:source $MYGVIMRC<cr>

" F7 : FullScreen (only works on Windows)
nnoremap <F7> :call ToggleFullScreen()<CR>
function! ToggleFullScreen()
  if &guioptions =~# 'C'
    set guioptions-=C
    if exists('s:go_temp')
      if s:go_temp =~# 'm'
        set guioptions+=m
      endif
      if s:go_temp =~# 'T'
        set guioptions+=T
      endif
    endif
    simalt ~r
  else
    let s:go_temp = &guioptions
    set guioptions+=C
    set guioptions-=m
    set guioptions-=T
    simalt ~x
  endif
endfunction

" transparent window when focus is out
augroup hack234
  autocmd!
  if s:is_windows
    autocmd FocusGained * set transparency=255
    autocmd FocusLost * set transparency=230
  endif
augroup END

" <Space>cd : Change current directory to opened file
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>') 
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction
nnoremap <silent> <Space>cd :<C-u>CD<CR>

" <space>sudo : reopen using sudo
nnoremap <silent> <space>sudo :e sudo:%<cr>

" Clipboard
if has('gui_running')
    set clipboard=unnamed
endif


set tabstop=4
"tabが押されたときに実際に挿入される空白の文字数
set softtabstop=4
"オートインデント時に挿入される空白文字数
set shiftwidth=4
"tabの代わりに半角スペースを挿入する

set autoindent
set expandtab

" Makefile prohibits using spaces instead of tab
autocmd BufNewFile,BufRead Makefile  set noexpandtab

" enable incremental search
set incsearch
" enable hilighting
set hlsearch


" file name completion
set wildmenu
set wildmode=list:longest,full

set number
set cmdheight=1

if s:is_windows && !has('gui_running')
    set encoding=cp932
else
    set encoding=utf-8
endif

" File Encodings
set fileencoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

autocmd BufNewFile *    set fileencoding=utf-8


syntax on
colorscheme desert
set laststatus=2

" tree view (for netrw)
" but netrw is replaced by VimFiler
let g:netrw_liststyle = 3

" home directory is default
if s:is_windows
    cd $HOME
else
    cd ~
endif

