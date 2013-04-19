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
NeoBundle "Shougo/vinarise"
" (Completion)
NeoBundle "Shougo/neocomplcache"
NeoBundle 'Shougo/neosnippet'

" unite sources
"NeoBundle "h1mesuke/unite-outline"
NeoBundle "meryngii/unite-outline"
NeoBundle "osyo-manga/unite-quickfix"
NeoBundle "tsukkee/unite-tag"

" File
NeoBundle "sudo.vim"
" Text
NeoBundle 'Align'
NeoBundle 'surround.vim'
" Comment
NeoBundle 'tomtom/tcomment_vim'
" View
NeoBundle 'thinca/vim-fontzoom'
NeoBundle 'thinca/vim-quickrun'
" Color theme
NeoBundle 'altercation/vim-colors-solarized.git'
NeoBundle 'tomasr/molokai'
NeoBundle 'jnurmine/Zenburn'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'jeffreyiacono/vim-colors-wombat'

NeoBundle 'ujihisa/unite-colorscheme'

" External Tools
NeoBundle 'tpope/vim-fugitive'


filetype plugin on
filetype plugin indent off
" NeoBundle's configuration ends

if has('gui_running')
    " default settings for neocomplcache & neosnippet

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



" VimFiler
let g:vimfiler_as_default_explorer = 1 " replace netrw
"let g:vimfiler_edit_action = 'tabopen' " Edit file by tabedit.
"let g:vimfiler_safe_mode_by_default = 0 " Enable file operation commands.
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
" Windows only and require latest vimproc.
let g:unite_kind_file_use_trashbox = 1 " Use trashbox.

nnoremap <silent> <Space>exp  :VimFilerSimple -buffer-name=explorer -winwidth=30 -toggle -no-quit<CR>
nnoremap <silent> <Space>f  :VimFilerCreate -quit<CR>

autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
    nmap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)
endfunction


" Unite.vim
nnoremap    [unite]   <Nop>
nmap    f [unite]

nnoremap <silent> [unite]b  :UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :Unite buffer file_mru file file/new<CR>
nnoremap <silent> [unite]u  :Unite source<CR>
nnoremap <silent> [unite]g  :Unite vimgrep<CR>

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
\ -buffer-name=files buffer file_mru bookmark file<CR>
"nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
"\ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite
\ -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
"nnoremap <silent> [unite]f
"\ :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]d
\ :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
nnoremap <silent> [unite]ma
\ :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me
\ :<C-u>Unite output:message<CR>
"nnoremap  [unite]f  :<C-u>Unite source<CR>

nnoremap <silent> [unite]s
        \ :<C-u>Unite -buffer-name=files -no-split
        \ jump_point file_point buffer_tab
        \ file_rec:! file file/new file_mru<CR>

" Start insert.
let g:unite_enable_start_insert = 1
"let g:unite_enable_short_source_names = 1

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " Overwrite settings.

    nmap <buffer> <ESC>      <Plug>(unite_exit)
    imap <buffer> jj      <Plug>(unite_insert_leave)
    "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

    imap <buffer><expr> j unite#smart_map('j', '')
    imap <buffer> <TAB>   <Plug>(unite_select_next_line)
    imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
    imap <buffer> '     <Plug>(unite_quick_match_default_action)
    nmap <buffer> '     <Plug>(unite_quick_match_default_action)
    imap <buffer><expr> x
            \ unite#smart_map('x', "\<Plug>(unite_quick_match_choose_action)")
    nmap <buffer> x     <Plug>(unite_quick_match_choose_action)
    nmap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-z>     <Plug>(unite_toggle_transpose_window)
    imap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-y>     <Plug>(unite_narrowing_path)
    nmap <buffer> <C-j>     <Plug>(unite_toggle_auto_preview)
    nmap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    imap <buffer> <C-r>     <Plug>(unite_narrowing_input_history)
    nnoremap <silent><buffer><expr> l
            \ unite#smart_map('l', unite#do_action('default'))

    let unite = unite#get_current_unite()
    if unite.buffer_name =~# '^search'
      nnoremap <silent><buffer><expr> r     unite#do_action('replace')
    else
      nnoremap <silent><buffer><expr> r     unite#do_action('rename')
    endif

    nnoremap <silent><buffer><expr> cd     unite#do_action('lcd')
    nnoremap <buffer><expr> S      unite#mappings#set_current_filters(
    \ empty(unite#mappings#get_current_filters()) ? ['sorter_reverse'] : [])
    endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

if executable('jvgrep')
  " For jvgrep.
  let g:unite_source_grep_command = 'jvgrep'
  let g:unite_source_grep_default_opts = '--exclude ''\.(git|svn|hg|bzr)'''
  let g:unite_source_grep_recursive_opt = '-R'
endif

" For ack.
if executable('ack-grep')
  " let g:unite_source_grep_command = 'ack-grep'
  " let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
  " let g:unite_source_grep_recursive_opt = ''
endif


" Align
let g:Align_xstrlen = 3

" VimShell
nnoremap <silent> <Space>sh :VimShell -split<cr>

let g:vimshell_right_prompt = 'getcwd()'

" Indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

"--- Key Bindings ---
" Ctrl + Dir : Resize window
nnoremap <C-left>   :vertical resize -5<cr>
nnoremap <C-right>  :vertical resize +5<cr>
nnoremap <C-down>   :resize +2<cr>
nnoremap <C-up>     :resize -2<cr>

" Alt + Up/Down : Change transparency
nnoremap <A-up>     :set transparency+=10<cr>
nnoremap <A-down>   :set transparency-=10<cr>


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

" 
nmap <F1> <nop>
imap <F1> <nop>



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

" ステータスラインの表示
set statusline=
set statusline+=[#%n]  " バッファ番号
set statusline+=%m     " %m 修正フラグ
set statusline+=%r     " %r 読み込み専用フラグ
set statusline+=%<     " 行が長すぎるときに切り詰める位置
set statusline+=%{fugitive#statusline()} " Gitのブランチ名を表示
set statusline+=%h     " %h ヘルプバッファフラグ
set statusline+=%w     " %w プレビューウィンドウフラグ
set statusline+=\ %{&filetype}\ \|\  
set statusline+=%{(&fenc!=''?&fenc:&enc)}\:%{&ff}\  " fencとffを表示
set statusline+=%#StatusLineFile#\ %F " バッファ内のファイルのフルパス
set statusline+=%=     " 左寄せ項目と右寄せ項目の区切り
set statusline+=\ %*\  " 空白スペース2個
set statusline+=%2cc   " 何列目にカーソルがあるか
set statusline+=:%l    " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%LL    " バッファ内の総行数

" 挿入モードでステータスラインをハイライト
if !exists('g:hi_insert')
  let g:hi_insert = 'highlight StatusLine guifg=White guibg=#775566 gui=none ctermfg=White ctermbg=DarkCyan cterm=none'
endif

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

set cursorline " カーソル行をハイライト

set list
set listchars=tab:▸\ ,eol:¬

set hidden " multiple editing


" tree view (for netrw)
" but netrw is replaced by VimFiler
let g:netrw_liststyle = 3

" home directory is default
if s:is_windows
    cd $HOME
else
    cd ~
endif


