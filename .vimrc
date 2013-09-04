" ---------------------------
"     .vimrc for meryngii
" ---------------------------

" Initial setup "{{{

" iMproved!
set nocompatible

let s:is_windows = has('win32') || has('win64')

let s:is_mac = !s:is_windows && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')

"}}}

" swap & backup "{{{
set swapfile
set directory=~/.vim/swap
set backup
set backupdir=~/.vim/backup
"}}}

" NeoBundle and Loaded plugins "{{{
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
NeoBundle "Shougo/neocomplete"
NeoBundle 'Shougo/neosnippet'

" unite sources
NeoBundle "Shougo/unite-outline"
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

" File-type
"NeoBundle 'mkd.vim'

" Quick-run
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/open-browser.vim'

" Folding
NeoBundle 'LeafCage/foldCC'

" Syntax checking
NeoBundle 'scrooloose/syntastic'

filetype plugin on
filetype plugin indent off

" "}}}

" [Space] Smart space mapping. "{{{
nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>
"}}}

" NeoComplCache & NeoSnippet "{{{

if has('gui_running')
    " default settings for neocomplcache & neosnippet

    "-- neocomplete --
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    let g:neocomplete#enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplete#sources#dictionary#dictionaries = {
        \ 'default' : '',
        \ 'vimshell' : $HOME.'/.vimshell_hist',
        \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

    " Define keyword.
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
      return neocomplete#smart_close_popup() . "\<CR>"
      " For no inserting <CR> key.
      "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    " Close popup by <Space>.
    "inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

    " For cursor moving in insert mode(Not recommended)
    "inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
    "inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
    "inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
    "inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
    " Or set this.
    "let g:neocomplete#enable_cursor_hold_i = 1
    " Or set this.
    "let g:neocomplete#enable_insert_char_pre = 1

    " AutoComplPop like behavior.
    "let g:neocomplete#enable_auto_select = 1

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

    " Enable heavy omni completion.
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

    " For perlomni.vim setting.
    " https://github.com/c9s/perlomni.vim
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    
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

"}}}

" VimFiler "{{{
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

nnoremap <silent> [Space]es  :VimFilerSimple -buffer-name=explorer -toggle -no-quit<CR>:set window=30<CR>:setlocal winfixwidth<CR>
"nnoremap <silent> [Space]es  :VimFilerSimple -buffer-name=explorer -winwidth=30 -toggle -no-quit<CR>
"nnoremap <silent> [Space]c  :VimFilerCreate -quit<CR>

autocmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
    nmap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)
endfunction
"}}}

" Unite.vim "{{{
nnoremap    [unite]   <Nop>
nmap    [Space]u [unite]

nnoremap <silent> [unite]b  :UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]f  :Unite buffer file_mru file file/new<CR>
nnoremap <silent> [unite]s  :Unite source<CR>
nnoremap <silent> [unite]g  :Unite vimgrep -auto-preview -no-quit -resume<CR>

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir
\ -buffer-name=files buffer file_mru bookmark file<CR>
"nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir
"\ -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite
\ -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]u
\ :<C-u>Unite -buffer-name=resume resume<CR>
nnoremap <silent> [unite]d
\ :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>
nnoremap <silent> [unite]ma
\ :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me
\ :<C-u>Unite output:message<CR>
"nnoremap  [unite]f  :<C-u>Unite source<CR>

nnoremap <silent> [unite]s
"nnoremap <silent> [unite]s
"        \ :<C-u>Unite -buffer-name=files -no-split
"        \ jump_point file_point buffer_tab
"        \ file_rec:! file file/new file_mru<CR>

nnoremap <silent> [unite]t
    \ :<C-u>Unite tab<CR>

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

"}}}

" Align "{{{
let g:Align_xstrlen = 3
"}}}

" VimShell "{{{
nnoremap <silent> [Space]sh :VimShell -split<cr>

let g:vimshell_right_prompt = 'getcwd()'
"}}}

" QuickRun "{{{
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'type' : 'markdown/pandoc',
      \ 'outputter': 'browser',
      \ 'args' : '-f markdown+definition_lists --standalone --mathjax'
      \ }
" [Space]run : QuickRun
nnoremap <silent> <Space>run :QuickRun<CR>
"}}}

" Key Bindings "{{{

" Alt + Arrow : Resize window "{{{
nnoremap <A-Left>   :vertical resize -5<cr>
nnoremap <A-Right>  :vertical resize +5<cr>
nnoremap <A-Up>   :resize -2<cr>
nnoremap <A-Down>     :resize +2<cr>
" }}}

" Alt + Up/Down : Change transparency "{{{
"nnoremap <A-up>     :set transparency+=10<cr>
"nnoremap <A-down>   :set transparency-=10<cr>
" }}}

" Ctrl+s: Reload .vimrc & .gvimrc
nnoremap <C-s> :source $MYVIMRC<cr>:source $MYGVIMRC<cr>

" Disable the default action of F1 to show help (to prevent mistype)
nmap <F1> <nop>
imap <F1> <nop>

" F7 : FullScreen (only works on Windows) "{{{
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
"}}}

" [Space]cd "{{{
" Move to the directory of the current buffer.
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
nnoremap <silent> [Space]cd     :<C-u>CD<CR>
"}}}

" <space>sudo : reopen using sudo
nnoremap <silent> [Space]sudo   :e sudo:%<cr>

" Fixing the size of the current window. "{{{

nmap z  [CurrentWindow]

" zw : Fix the height of the current window.
nnoremap [CurrentWindow]w   :<C-u>setlocal winfixwidth!<CR>

" zh : Fix the height of the current window.
nnoremap [CurrentWindow]h   :<C-u>setlocal winfixheight!<CR>

"}}}

" Keep the correct indent despite blank lines.
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>

"}}}

" Folding "{{{
set foldenable
set foldmethod=marker
set commentstring=%s
set foldtext=FoldCCtext()

noremap [fold]     <Nop>
nmap    [Space]f [fold]
vmap    [Space]f [fold]

" move over foldings
noremap [Space]j    zj
noremap [space]k    zk

" toggle
noremap [fold]a    za
" [h]ide all foldings
noremap [fold]h    zM
" [s]how all foldings
noremap [fold]s    zR
" show only current folding
noremap [fold]i    zMzv
" make [f]olding
noremap [fold]f    zf
" [d]elete folding
noremap [fold]d    zd

"noremap [fold]u :<C-u>Unite outline:foldings<CR>
noremap [fold]w :<C-u>echo FoldCCnavi()<CR>

autocmd FileType lua  setlocal commentstring=--%s
autocmd FileType vim  setlocal commentstring=\"%s
autocmd FileType php  setlocal commentstring=//%s

"}}}

" Tab "{{{

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '+' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%='
  let s .= '%=' . ' %{fugitive#statusline()} ' . getcwd() . ' '
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2 " 常にタブラインを表示

" Use text-based tab pages.
set guioptions-=e

" The prefix key.
nnoremap    [Tabpage]   <Nop>
nmap    t [Tabpage]

" Tab jump
for n in range(1, 9)
  execute 'nnoremap <silent> [Tabpage]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor
" t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ

map <silent> [Tabpage]c :tablast <bar> tabnew<CR>
" tc 新しいタブを一番右に作る
map <silent> [Tabpage]x :tabclose<CR>
" tx タブを閉じる
map <silent> [Tabpage]n :tabnext<CR>
" tn 次のタブ
map <silent> [Tabpage]p :tabprevious<CR>
" tp 前のタブ

"}}}

" Indent "{{{
set tabstop=4
" tabが押されたときに実際に挿入される空白の文字数
set softtabstop=4
" オートインデント時に挿入される空白文字数
set shiftwidth=4
" tabの代わりに半角スペースを挿入する

set autoindent
set expandtab
"}}}

" Tag "{{{

if has('path_extra')
    set tags+=tags;
endif

"nnoremap <C-]> :<C-u>UniteWithCursorWord tag<CR>

"}}}

" File Type {{{

" Makefile prohibits using spaces instead of tab
autocmd BufNewFile,BufRead Makefile  set noexpandtab

" Markdown
autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
autocmd BufRead,BufNewFile *.md  set filetype=markdown

" Configuration Files
autocmd BufRead,BufNewFile _zshrc   set filetype=zsh
autocmd BufRead,BufNewFile _gitconfig   set filetype=gitconfig

"}}}

" File Encodings "{{{
if s:is_windows && !has('gui_running')
    set encoding=cp932
else
    set encoding=utf-8
endif

set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp,cp932

" Create a new buffer with UTF-8.
autocmd BufNewFile *    set fileencoding=utf-8

" Commands to reopen with the specified character code "{{{
command! -bang -bar -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8 <args>
command! -bang -bar -complete=file -nargs=? Iso2022jp edit<bang> ++enc=iso-2022-jp <args>
command! -bang -bar -complete=file -nargs=? Cp932 edit<bang> ++enc=cp932 <args>
command! -bang -bar -complete=file -nargs=? Euc edit<bang> ++enc=euc-jp <args>
command! -bang -bar -complete=file -nargs=? Utf16 edit<bang> ++enc=ucs-2le <args>
command! -bang -bar -complete=file -nargs=? Utf16be edit<bang> ++enc=ucs-2 <args>

command! -bang -bar -complete=file -nargs=? Jis  Iso2022jp<bang> <args>
command! -bang -bar -complete=file -nargs=? Sjis  Cp932<bang> <args>
command! -bang -bar -complete=file -nargs=? Unicode Utf16<bang> <args>
"}}}

"}}}

" Basic Settings "{{{

" Searching "{{{

" Enable incremental search.
set incsearch
" Enable highlighting when searching.
set hlsearch

" }}}

" File name completion
set wildmenu
set wildmode=list:longest,full

" Shows line number.
set number

" Sets the height of command line.
set cmdheight=1

" Highlights current line.
set cursorline

set list
set listchars=tab:▸\ ,eol:¬

" Enable backspace delete indent and newline.
set backspace=indent,eol,start

" Enable hidden buffers.
set hidden

" Clipboard
if has('gui_running')
    set clipboard=unnamed
endif

" Disable beep.
set vb t_vb=

" Disable automatic newline insertion.
set textwidth=0

autocmd FileType text setlocal textwidth=0

" Disable automatic window resizing.
" (Use <C-w>= to resize the windows manually.)
set noequalalways

" Colorscheme "{{{
syntax on
colorscheme desert
set laststatus=2
"}}}

" Status Line "{{{

" ステータスラインの表示
set statusline=
set statusline+=[#%n]  " バッファ番号
set statusline+=%m     " %m 修正フラグ
set statusline+=%r     " %r 読み込み専用フラグ
"set statusline+=%{fugitive#statusline()} " Gitのブランチ名を表示
set statusline+=%<     " 行が長すぎるときに切り詰める位置
set statusline+=%h     " %h ヘルプバッファフラグ
set statusline+=%w     " %w プレビューウィンドウフラグ
set statusline+=\ %{&filetype}\ \|\  
set statusline+=%{(&fenc!=''?&fenc:&enc)}\:%{&ff}\  " fencとffを表示
set statusline+=%#StatusLineFile#\ %F " バッファ内のファイルのフルパス
set statusline+=%=     " 左寄せ項目と右寄せ項目の区切り
set statusline+=\ %*\  " 空白スペース2個
set statusline+=C%2c   " 何列目にカーソルがあるか
set statusline+=:L%l    " 何行目にカーソルがあるか
set statusline+=/
set statusline+=%L    " バッファ内の総行数

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

"}}}

" Highlight current line.
set cursorline

" Automatic reloading.
set autoread

set list
set listchars=tab:▸\ ,eol:¬

" Enable hidden buffers.
set hidden

" Continue visual mode.
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" tree view (for netrw) "{{{
" but netrw is replaced by VimFiler
let g:netrw_liststyle = 3
"}}}

" Force :make to use the option --print-directory.
set makeprg=make\ -w

" Auto reloading.
set autoread

" Check the external changes on WinEnter. "{{{
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END
"}}}

" Default directory to HOME.
cd ~

"}}}

" vim: foldmethod=marker
