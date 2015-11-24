"
" Configuration for NeoVim
"

" Start-up "{{{

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    " Be iMproved
    set nocompatible
  endif
endif

" Create a new autocmd group.
augroup MyAutoCmd
    autocmd!
augroup END

" }}}

" NeoBundle "{{{

if has('vim_starting')
  " Required:
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.config/nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" Thanks to Shougo-san
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/vimfiler.vim"
" Status Line
NeoBundle "itchyny/lightline.vim"
" Colorschemes
NeoBundle "altercation/vim-colors-solarized"
NeoBundle "w0ng/vim-hybrid"

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"}}}

" Swap, backup and undo "{{{
set swapfile
set directory=~/.config/nvim/swap
set backup
set backupdir=~/.config/nvim/backup

"" This feature has a bug in Neovim 0.1.0
"if has('persistent_undo')
"    set undofile
"    set undodir=~/.config/nvim/undo
"endif
"}}}

" Built-in features "{{{

" Enable hidden buffers.
set hidden

" Automatic reloading.
set autoread

" Share the clipboard with other applications.
if has("clipboard")
    set clipboard^=unnamedplus
    set clipboard^=unnamed
end

" Enable incremental search.
set incsearch
" Enable highlighting during searching.
set hlsearch

" Enables ignoring case.
set ignorecase
" Enables smartcase.
set smartcase

" File name completion
set wildmenu
set wildmode=list:longest,full

" Show the line number.
set number

" Set the height of command line.
set cmdheight=1

" Always show the status bar.
set laststatus=2


" Disable the beep.
set vb t_vb=

" Disable automatic window resizing.
" (Use <C-w>= to resize the windows manually.)
set noequalalways

" Keep the visual mode on indentation.
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" Force :make to use the option --print-directory.
set makeprg=make\ -w

" Disable completeopt.
set completeopt=menuone

" Do not jump to first character with page commands.
set nostartofline

" Disable automatic comment insertion.
autocmd MyAutoCmd FileType * setlocal formatoptions-=ro

"}}}

" Indent "{{{

set tabstop=4
set softtabstop=4
set shiftwidth=4

set autoindent
set expandtab

"}}}

" Key Bindings "{{{

" [Space] Smart space mapping. "{{{
nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>
"}}}

" Alt + Arrow : Resize window "{{{
nnoremap <silent> <A-Left>    :vertical resize -5<cr>
nnoremap <silent> <A-Right>   :vertical resize +5<cr>
nnoremap <silent> <A-Up>      :resize -2<cr>
nnoremap <silent> <A-Down>    :resize +2<cr>
" }}}

" Key Bindings for Command-line mode "{{{

" <C-a>, A: move to head.
cnoremap <C-a>          <Home>
" <C-b>: previous char.
cnoremap <C-b>          <Left>
" <C-d>: delete char.
cnoremap <C-d>          <Del>
" <C-e>, E: move to end.
cnoremap <C-e>          <End>
" <C-f>: next char.
cnoremap <C-f>          <Right>
" <C-n>: next history.
cnoremap <C-n>          <Down>
" <C-p>: previous history.
cnoremap <C-p>          <Up>
" <C-k>, K: delete to end.
cnoremap <C-k> <C-\>e getcmdpos() == 1 ?
      \ '' : getcmdline()[:getcmdpos()-2]<CR>
" <C-y>: paste.
cnoremap <C-y>          <C-r>*

"}}}

" [Space]t : Spawn a new terminal.
nnoremap <silent> [Space]t
\ :rightb 17sp<CR>:terminal<CR>

" Escape from the terminal window.
tnoremap <Esc> <C-\><C-n>

"}}}

" Folding "{{{

set foldenable
set foldmethod=syntax
set commentstring=%s

noremap [fold]     <Nop>
nmap    [Space]f [fold]
vmap    [Space]f [fold]

" Move over foldings.
noremap [Space]j    zj
noremap [space]k    zk

" Toggle.
noremap [fold]f    za
" [H]ide all foldings
noremap [fold]h    zM
" [S]how all foldings
noremap [fold]s    zR
" [M]ake a folding.
noremap [fold]m    zm
" [D]elete a folding.
noremap [fold]d    zd

"}}}

" VimFiler "{{{

" Replace netrw.
let g:vimfiler_as_default_explorer = 1

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
if has('gui_running')
    let g:vimfiler_tree_opened_icon = '▾'
    let g:vimfiler_tree_closed_icon = '▸'
else
    let g:vimfiler_tree_opened_icon = 'V'
    let g:vimfiler_tree_closed_icon = '>'
endif
let g:vimfiler_file_icon = '-'
"
" [Space]x : Open the VimFiler with explorer-like style.
nnoremap <silent> [Space]x
\ :VimFilerSimple -buffer-name=explorer -toggle -no-quit<CR>
\ :vertical resize 25<CR>
\ :setlocal winfixwidth<CR>
\ :setlocal nonumber<CR>

"}}}

" Styles {{{

syntax on

set background=dark

"colorscheme desert
colorscheme hybrid

"}}}

" vim: foldmethod=marker
