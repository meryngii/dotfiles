" ---------------------------
"     .vimrc for meryngii
" ---------------------------

" Initial setup "{{{

" iMproved!
set nocompatible

let s:is_windows = has('win32') || has('win64')

let s:is_mac = !s:is_windows && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')

" Set autocmd group.
augroup MyAutoCmd
    autocmd!
augroup END

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

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Thanks to Shougo-san
NeoBundle "Shougo/vimproc.vim", {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle "Shougo/vimshell.vim"
NeoBundle "Shougo/unite.vim"
NeoBundle "Shougo/neomru.vim"
NeoBundle "Shougo/vimfiler.vim"
NeoBundle 'git://github.com/Shougo/vinarise.git' " avoids error
if has('gui_running')
    NeoBundle "Shougo/neocomplete.vim"
    NeoBundle 'Shougo/neosnippet.vim'
endif

" unite sources
NeoBundle "Shougo/unite-outline"
NeoBundle "osyo-manga/unite-quickfix"
NeoBundle "tsukkee/unite-tag"
NeoBundle "Shougo/unite-build"

" File
NeoBundle "sudo.vim"
" Text
NeoBundle 'Align'
NeoBundle 'godlygeek/tabular'
NeoBundle 'surround.vim'
NeoBundle 'bkad/CamelCaseMotion'
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

NeoBundle 'bling/vim-airline'

" External Tools
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-rooter'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-easytags'

" Quick-run
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/open-browser.vim'

" Folding
NeoBundle 'LeafCage/foldCC'

" Syntax checking
NeoBundle 'scrooloose/syntastic'

" Game
NeoBundle 'rbtnn/puyo.vim'

if !s:is_windows && !s:is_mac 
    NeoBundle 'anekos/felis-cat-igirisu-toast-express'
endif

filetype plugin on
filetype plugin indent off

" Check if the specified plugins are installed.
NeoBundleCheck

"}}}

" [Space] Smart space mapping. "{{{
nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>
"}}}

" NeoComplete & NeoSnippet "{{{

if has('gui_running')
    " default settings for neocomplcache & neosnippet

    "-- neocomplete --
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplete.
    let g:neocomplete#enable_at_startup = 1
    " Use smartcase.
    "let g:neocomplete#enable_smart_case = 1

    let g:neocomplete#enable_ignore_case = 1
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

    " Shell like behavior(not recommended).
    "set completeopt+=longest
    "let g:neocomplete#enable_auto_select = 1
    "let g:neocomplete#disable_auto_complete = 1
    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

    " Enable omni completion.
    augroup OmniCompletionGroup
        autocmd!
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    augroup END

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

    " Disable converter_case.
    call neocomplete#custom#source('_', 'converters', ['converter_abbr', 'converter_delimiter'])

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
"let g:vimfiler_safe_mode_by_default = 0 " Enable file operation commands.
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
let g:vimfiler_marked_file_icon = '*'
" Windows only and require latest vimproc.
let g:unite_kind_file_use_trashbox = 1 " Use trashbox.

" [Space]x : Open the VimFiler with explorer-like style.
nnoremap <silent> [Space]x
\ :VimFilerSimple -buffer-name=explorer -toggle -no-quit<CR>
\ :vertical resize 25<CR>
\ :setlocal winfixwidth<CR>
\ :setlocal nonumber<CR>

" Ctrl + R (VimFiler) : Refresh the list of files.
autocmd MyAutoCmd FileType vimfiler call s:vimfiler_my_settings()
function! s:vimfiler_my_settings()
    nmap <buffer> <C-r> <Plug>(vimfiler_redraw_screen)
endfunction

let g:vimfiler_force_overwrite_statusline = 0

"}}}

" Unite.vim "{{{
nnoremap    [unite]   <Nop>
nmap    [Space]u [unite]

nnoremap <silent> [unite]b  :<C-u>Unite -buffer-name=buffers -no-start-insert buffer<CR>
nnoremap <silent> [unite]f  :<C-u>Unite -buffer-name=files buffer file_mru file file/new<CR>
nnoremap <silent> [unite]s  :<C-u>Unite -buffer-name=sources source<CR>
nnoremap <silent> [unite]g  :<C-u>Unite -buffer-name=vimgrep vimgrep -auto-preview -no-quit -resume<CR>

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>

nnoremap <silent> [unite]o  :<C-u>Unite -buffer-name=outline outline<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=resume -no-start-insert  resume<CR>
nnoremap <silent> [unite]d  :<C-u>Unite -buffer-name=files -default-action=lcd directory_mru<CR>

nnoremap <silent> [unite]ma :<C-u>Unite mapping<CR>
nnoremap <silent> [unite]me :<C-u>Unite output:message<CR>

nnoremap <silent> [unite]t  :<C-u>Unite tag<CR>

nnoremap <silent> [unite]u  :<C-u>Unite file_rec/async<CR>

nnoremap <silent> [unite]q  :<C-u>Unite quickfix<CR>

" Start insert.
let g:unite_enable_start_insert = 1
"let g:unite_enable_short_source_names = 1

autocmd MyAutoCmd FileType unite call s:unite_my_settings()
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

" For jvgrep.
if executable('jvgrep')
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

" QuickRun "{{{
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
      \ 'type' : 'markdown/pandoc',
      \ 'outputter': 'browser',
      \ 'args' : '-f markdown+definition_lists --standalone --mathjax'
      \ }

" [Space]e : QuickRun
nnoremap <silent> <Space>e  :QuickRun<CR>
"}}}

" Other Plugins "{{{

" VimShell "{{{
nnoremap <silent> [Space]s
\ :VimShellBufferDir -split -split-command=belowright\ 10split<CR>

let g:vimshell_right_prompt = 'getcwd()'
"}}}

" Align "{{{
let g:Align_xstrlen = 3
"}}}

" Syntastic "{{{
let g:syntastic_cpp_compiler = 'g++-4.8'
let g:syntastic_cpp_compiler_options = ' -std=c++11'
"}}}

" Airline "{{{

let g:airline#extensions#tabline#enabled = 1

"}}}

" EasyTags "{{{
let g:easytags_suppress_ctags_warning = 1
"}}}

"}}}

" Key Bindings "{{{

" Toggle the option. "{{{
function! ToggleOption(option_name)
    execute 'setlocal ' a:option_name.'!'
endfunction
"}}}

" Alt key on Mac. {{{
if s:is_mac && has('gui_running')
    " Use option key as meta key.
    set macmeta

    " Disable some default key-bindings of MacVim.
    let macvim_skip_cmd_opt_movement = 1
endif
" }}}

" Alt + Arrow : Resize window "{{{
nnoremap <silent> <A-Left>    :vertical resize -5<cr>
nnoremap <silent> <A-Right>   :vertical resize +5<cr>
nnoremap <silent> <A-Up>      :resize -2<cr>
nnoremap <silent> <A-Down>    :resize +2<cr>
" }}}

" Alt + Shift + Up/Down : Change transparency "{{{
if s:is_mac
    nnoremap <A-S-up>     :set transparency-=5<cr>
    nnoremap <A-S-down>   :set transparency+=5<cr>
else
    nnoremap <A-S-up>     :set transparency+=10<cr>
    nnoremap <A-S-down>   :set transparency-=10<cr>
end
" }}}

" Ctrl + s : Reload .vimrc & .gvimrc
nnoremap <C-s> :source $MYVIMRC<cr>:source $MYGVIMRC<cr>

" Disable the default action of F1 to show help (to prevent mistype)
nmap <F1> <nop>
imap <F1> <nop>

" Disable Ex-mode.
nnoremap Q q

" Ctrl + c : Move to the directory of the current buffer. "{{{
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
command! -nargs=? -complete=dir -bang CD  call s:ChangeCurrentDir('<args>', '<bang>')

nnoremap <silent> <C-c>        :<C-U>CD<CR>
"}}}

" vim-rooter "{{{

" [Space]r : Move to the root directory.
nnoremap <silent> [Space]r     :<C-u>Rooter<CR>

let g:rooter_manual_only = 1
let g:rooter_change_directory_for_non_project_files = 1

"}}}

" [space]su : reopen using sudo
nnoremap <silent> [Space]su   :e sudo:%<cr>

" Fixing the size of the current window. "{{{

" [Space]fixw : Fix the height of the current window.
nnoremap [Space]fixw   :<C-u>call ToggleOption('winfixhwidth')<CR>

" [Space]fixh : Fix the height of the current window.
nnoremap [Space]fixh   :<C-u>call ToggleOption('winfixheight')<CR>

"}}}

" Keep the correct indent despite blank lines. {{{
nnoremap o oX<C-h>
nnoremap O OX<C-h>
inoremap <CR> <CR>X<C-h>
" }}}

" :RemoveSwap : Remove all swap files. {{{
function! s:remove_swapfiles()
    let list = split(glob("~/.vim/swap/*"), "\n")
    for file in list
        echo file
        call delete(file)
    endfor
endfunction
command! -nargs=0 RemoveSwap  call s:remove_swapfiles()
" }}}

" CamelCaseMotion
map <S-W> <Plug>CamelCaseMotion_w
map <S-B> <Plug>CamelCaseMotion_b
map <S-E> <Plug>CamelCaseMotion_e

" Key Bindings for Insert Mode {{{

" <C-t>: insert tab.
inoremap <C-t>  <C-v><TAB>
" <C-d>: delete char.
inoremap <C-d>  <Del>
" <C-a>: move to head.
inoremap <silent><C-a>  <C-o>^
" Enable undo <C-w> and <C-u>.
inoremap <C-w>  <C-g>u<C-w>
inoremap <C-u>  <C-g>u<C-u>

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
noremap [fold]f    za
" [h]ide all foldings
noremap [fold]h    zM
" [s]how all foldings
noremap [fold]s    zR
" show only current folding
noremap [fold]i    zMzv
" [m]ake folding
noremap [fold]m    zm
" [d]elete folding
noremap [fold]d    zd

"noremap [fold]u :<C-u>Unite outline:foldings<CR>
noremap [fold]w :<C-u>echo FoldCCnavi()<CR>

" z : Toggle the folding.
noremap z  za

augroup FoldingCommentGroup
    autocmd!
    autocmd FileType lua  setlocal commentstring=--%s
    autocmd FileType vim  setlocal commentstring=\"%s
    autocmd FileType php  setlocal commentstring=//%s
augroup END

"}}}

" Tab "{{{

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

if neobundle#is_installed("vim-fugitive")
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
endif
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

" Ctrl + j : tag jump with unite-tag
nnoremap <C-j> :<C-u>UniteWithCursorWord -immediately tag<CR>

"}}}

" File Type "{{{
augroup FiletypeGroup
    autocmd!

    " Makefile prohibits using spaces instead of tab
    autocmd BufNewFile,BufRead Makefile  set noexpandtab

    " Markdown
    autocmd BufRead,BufNewFile *.mkd  set filetype=markdown
    autocmd BufRead,BufNewFile *.md  set filetype=markdown
augroup END
"}}}

" File Encodings, File Formats "{{{
if s:is_windows && !has('gui_running')
    set encoding=cp932
else
    set encoding=utf-8
endif

set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp,cp932

" Uses the UNIX line-feed as default.
set fileformat=unix
set fileformats=unix,dos,mac

" Create a new buffer with UTF-8.
autocmd MyAutoCmd BufNewFile *    set fileencoding=utf-8

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


"command! -nargs=? Make  :Unite build:make:-w:<args> -no-start-insert -no-quit -winheight=10

" Ctrl + m : Execute make.
nnoremap <C-m>   :make<Space>
" Ctrl + Alt + m : Execute make clean.
nnoremap <C-A-m> :make clean<CR>

"}}}
         "movl (%%rbx), %%eax;"

"}}}

" Path "{{{
let &path = &path . "," . substitute(glob("/usr/include/c++/*") . glob("/usr/local/include") . glob("/usr/local/include/c++/*"), "\n", ",", "g")
"}}}

" Syntax "{{{

" Enable the spell checker.
set spell

" Show the syntax name on the cursor position.
command! -bang -bar Highlight :echo synIDattr(synID(line('.'), col('.'), 0), 'name')

"}}}

" Basic Settings "{{{

" Searching "{{{

" Enable incremental search.
set incsearch
" Enable highlighting during searching.
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
if has("clipboard")
    set clipboard^=unnamedplus
    set clipboard^=unnamed
end

" Disable beep.
set vb t_vb=

" Disable automatic newline insertion.
set textwidth=0
autocmd MyAutoCmd FileType text setlocal textwidth=0

" Disable automatic window resizing.
" (Use <C-w>= to resize the windows manually.)
set noequalalways

" Always show the status bar.
set laststatus=2

" Enable the syntax highlighting.
syntax on

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

" Enable hidden buffers.
set hidden

" Enables ignoring case.
set ignorecase

" Enables smartcase.
set smartcase

" Keep the visual mode on indentation.
vnoremap <silent> > >gv
vnoremap <silent> < <gv

" Show tabs and new-lines.
set list
set listchars=tab:▸\ ,eol:¬

" tree view (for netrw) "{{{
" but netrw is replaced by VimFiler
let g:netrw_liststyle = 3

"}}}

" Force :make to use the option --print-directory.
set makeprg=make\ -w

" Automatic reloading.
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

" Colorscheme {{{

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

colorscheme desert

" }}}

" vim: foldmethod=marker
