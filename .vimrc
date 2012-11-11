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
NeoBundle 'Shougo/neosnippet'
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

" Color Theme
NeoBundle 'altercation/vim-colors-solarized.git'


filetype plugin indent on

" vimfiler
let g:vimfiler_as_default_explorer = 1
"let g:vimfiler_edit_action = 'tabopen'
nnoremap <F2> :VimFiler -buffer-name=explorer -no-quit<Cr>

if has('gui_running')
    "-- neocomplcache --
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Use camel case completion.
    let g:neocomplcache_enable_camel_case_completion = 1
    " Use underbar completion.
    let g:neocomplcache_enable_underbar_completion = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
      let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

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

    " AutoComplPop like behavior.
    "let g:neocomplcache_enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplcache_enable_auto_select = 1
    "let g:neocomplcache_disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
    "inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
      let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
    "autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
    let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'


    "-- neosnippet --
    " Plugin key-mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)

    " SuperTab like snippets behavior.
    imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
    smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    " For snippet_complete marker.
    "if has('conceal')
    "  set conceallevel=2 concealcursor=i
    "endif


    " my settings below
    let g:neosnippet#snippets_directory='~/.vim/snippets'
    "let g:neocomplcache_manual_completion_start_length = 1
    let g:neocomplcache_lock_buffer_name_pattern = '.*\.tex'
endif


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

if s:is_windows && !has('gui_running')
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
    cd ~
endif

