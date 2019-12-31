" pdh -- vimrc file, started 31 aug 2007
" vim: set tw=0 sts=2 sw=2
" Maintainer:  padh@gmail.com
" Updated:     2016-01-01
"
" When started as "evim", evim.vim will already have its settings.
if v:progname =~? "evim"
  finish
endif

" Vundle: {{{1, a vim plugin manager
" See https://github.com/gmarik/Vundle.vim
"
" Brief help {{{2
" --------------
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches www.vim-scripts.org (only!) for foo;
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" :h vundle         - for more details
"
" Install a new plugin
" --------------------
" 1. add Plugin statement inbetween vundle#begin() /#end() calls
" 2. restart vim (or source .vimrc again) and do :PluginInstall
" Notes:
" - Quit/Start Vim after changing any of the repo-url's!
" - in Vundle window, hit 'u' for changelog, l for command log
" - Install plugins from different sources as follows
"   Plugin 'gmarik/vundle.vim'                   - from github.com
"   Plugin 'L9'                                  - from http://vim-scripts.org/vim/scripts.html
"   Plugin 'git://git.wincent.com/command-t.git' - from some other git repo
"   Plugin 'file:///full-path/to/plugin/git-repo - from local machine
"   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}   - from subdir of repo
"   Plugin 'user/L9', {'name': 'newL9'}          - avoid name conflict
"
" Remove an old plugin
" --------------------
" - In dotvimrc:   remove/comment out  the Plugin statement
" - ~/.vim/bundle: rm -rf <plugin-directory-to-be-removed>
"
" Update an existing plugin
" -------------------------
" :PluginInstall!    with a bang!
" :PluginUpdate      same thing
" Notes:
" - once done, hit 'l' to view the log
" - PluginInstall! wont let you give a name

" Vundle {{{1
set nocompatible                               " required
filetype off                                   " required
set rtp+=~/.vim/bundle/Vundle.vim              " add vundle to runtimepath
call vundle#begin('~/.vim/bundle')             " vundle#begin => ~/.vim/bundle

" Libs Used:  {{{2
" Notes:
" o vimproc updated? => cd ~/.vim/bundle/vimproc.vim/ && make
Plugin 'https://github.com/gmarik/Vundle.vim'   " required for Vundle
Plugin 'https://github.com/Shougo/vimproc.vim.git'  " async processing; post-install make!
Plugin 'https://github.com/tomtom/tlib_vim.git' " utility functions by tomtom
Plugin 'https://github.com/vim-scripts/L9.git'  " VimL programming library

" Plugins: {{{2
" Navigation: {{{3
Plugin 'https://github.com/vim-voom/VOoM.git'              " 2-pane file navigator
Plugin 'https://github.com/zeroflyfire/taglist.vim.git'    " --?-- vs ttags by tomtom?
Plugin 'https://github.com/haya14busa/incsearch.vim'       " TODO: --?-- usefull?
" FindFiles: {{{3
Plugin 'https://github.com/vim-scripts/utl.vim.git'        " gf, gx etc..
Plugin 'https://github.com/rking/ag.vim'                   " silver searcher grep
" Shougo: {{{3
Plugin 'https://github.com/Shougo/unite.vim.git'           " Unite & friends
Plugin 'https://github.com/sgur/unite-qf.git'              " quickfix/loclist as Unite source
Plugin 'https://github.com/Shougo/unite-outline.git'       " outline for various file types
Plugin 'https://github.com/Shougo/vimshell.vim.git'        " Awesome VimShell
if has("nvim")
  Plugin 'https://github.com/Shougo/deoplete.nvim.git'       " nvim alternative to neocomplete
else
  Plugin 'https://github.com/Shougo/neocomplete.vim.git'     " auto completion of EVERYTHING
endif
Plugin 'https://github.com/Shougo/neosnippet.vim.git'
Plugin 'https://github.com/Shougo/neosnippet-snippets.git'
Plugin 'https://github.com/honza/vim-snippets.git'
"Plugin 'https://github.com/Shougo/vimfiler.vim.git'       " --?--
" CodeSearch: - Russ Cox
" http://swtch.com/~rsc/regexp/regexp4.html
" https://github.com/junkblocker/codesearch.git
" https://github.com/junkblocker/unite-codesearch.git
" Tpope: {{{3
Plugin 'https://github.com/tpope/vim-surround.git'     " easy add/del surrounds
"Plugin 'https://github.com/tpope/vim-scriptease.git'  " when scripting
Plugin 'https://github.com/tpope/vim-unimpaired.git'
Plugin 'https://github.com/tpope/vim-vinegar.git'      " << no more NERDTREE
Plugin 'https://github.com/tpope/vim-commentary'       " gc to (un)comment code
Plugin 'https://github.com/tpope/vim-fugitive.git'     " git support
Plugin 'https://github.com/tpope/vim-dispatch.git'     " spawn processes
" Various: {{{3
"Plugin vim-sneak " lighter alternative to easymotion? --?--
"Plugin 'https://github.com/Lokaltog/vim-easymotion.git'           " --?-- 
Plugin 'https://github.com/tomtom/tgpg_vim.git'  " used in pw <vault>
Plugin 'https://github.com/godlygeek/tabular.git'

Plugin 'https://github.com/andymass/vim-matchup.git'   " replaces vim-matchit.git
" Plugin 'https://github.com/edsono/vim-matchit.git'
Plugin 'https://github.com/scrooloose/syntastic.git'
" Ruby: {{{3
" Plugin 'https://github.com/vim-ruby/vim-ruby.git'                 " ruby support
" Plugin 'https://github.com/kmdsbng/vim-ruby-eval.git'
" Plugin 'https://github.com/t9md/vim-ruby-xmpfilter.git'
" Python: {{{3
Plugin 'https://github.com/hdima/python-syntax.git'               " Python - syntax
Plugin 'https://github.com/hynek/vim-python-pep8-indent'          " Python - indent
Plugin 'https://github.com/fs111/pydoc.vim'                       " Python - help
Plugin 'https://github.com/vim-scripts/pep8.git'                  " Python - political correctness
Plugin 'https://github.com/yegle/python_match.git'                " Python - motions %,[%,]%,g%
" Javascript {{{3
Plugin 'https://github.com/1995eaton/vim-better-javascript-completion.git'
Plugin 'https://github.com/ternjs/tern_for_vim.git'

" Completion: {{{3
" - now done using Shougo's Unite
" Plugin 'https://github.com/Valloric/YouCompleteMe'                " Completion
"   If updated, may require recompiling:
"   cd ~/.vim/bundle/YouCompleteMe/
"   sudo ./install.sh --clang-completer
" JAVASCRIPT: {{{3
Plugin 'https://github.com/pangloss/vim-javascript.git'     "syntax & indent
" HTML: {{{3
Plugin 'https://github.com/mattn/emmet-vim.git'                   ".class<tab>
" Pandoc: {{{3
Plugin 'https://github.com/vim-pandoc/vim-pandoc.git'                 " Pandoc
Plugin 'https://github.com/vim-pandoc/vim-pandoc-syntax.git'
Plugin 'https://github.com/vim-pandoc/vim-pandoc-after.git'           " ,,

" Colors: {{{3
Plugin 'https://github.com/ajh17/Spacegray.vim.git'    " Dark colorscheme
Plugin 'https://github.com/scwood/vim-hybrid.git'      " Another dark colorscheme
"Plugin 'https://github.com/godlygeek/colorchart.git'             " ,, (uncomment when needed)

" Scratch Stuff: {{{2
Plugin 'https://github.com/powerman/vim-plugin-viewdoc.git'
Plugin 'https://github.com/hertogp/dialk'              " dial K for help
call vundle#end()                              "vundle#end

filetype plugin indent on

" end Vundle

" Plugin configuration {{{1
" -------------------------
" Unite: {{{2
" https://github.com/Shougo/unite.vim.git
" Fuzzy match by default
let g:unite_data_directory=expand('~/.cache/unite')
let g:unite_source_buffer_time_format=" (%Y-%m-%d %H:%M:%S)"
let g:unite_source_grep_max_candidates=2000
" when browsing grep results, cursorline changes background of the line
" so hilighting matches with a bgcolor gets messed up on the current line
" so use something without special background, like Question
let g:unite_source_grep_search_word_highlight='Question'
if executable('ag') " Use ag in unite file actions.
    " Grep
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = "-i --nocolor --nogroup --hidden --ignore '*.pdf' --ignore '*.rtf' " .
          \ "--ignore '*.vce' "
    let g:unite_source_grep_recursive_opt = ''

    " file list
    let g:unite_source_rec_async_command = ['ag','--follow','--nocolor','--nogroup','--hidden','-g', '']
endif
let g:unite_source_alias_aliases = {
            \'notes':{'source': 'file_rec', 'args': '/home/www/notes'},
            \ 'dwark':{'source': 'file_rec','args': '/home/www/dwark'},
            \}
call unite#filters#matcher_default#use(['matcher_regexp'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file,file/new,file_rec,file_rec/async', 'matchers',
      \'matcher_regexp')
call unite#custom#source('outline,line,grep,session', 'matchers','matcher_regexp')

" no limit on number of files found in candidate list
let g:unite_source_rec_max_cache_files = 0
call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)

" allow up to 200 candidates when grepping files
call unite#custom#source('grep', 'max_candidates', 200)
call unite#custom#profile('default', 'context', {
      \ 'prompt': '»',
      \ 'update_time': 200,
      \ 'direction': 'botright',
      \ 'prompt_direction': 'top',
      \ })
call unite#custom#profile('source/file', 'context', {
            \ 'start-insert' : 1,
            \ 'no-split' : 1,
            \})

hi link unitePrompt Function

fun! My_unite_settings()
    nnoremap <silent><buffer>q :UniteClose
    nnoremap <buffer><F5> <Plug>(unite_restart)
    nnoremap <buffer><F3> <Plug>(unite_toggle_auto_preview)
endfun


augroup UniteGrp
    au!
    autocmd FileType unite call My_unite_settings()
augroup END

" Unite Outline:
" https://github.com/h1mesuke/unite-outline.git  <-- h1mesuke = gone
" https://github.com/Shougo/unite-outline.git    <-- installed this one
let g:unite_abbr_highlight = 'Normal'
let g:unite_source_outline_highlight = {}
" Unite QuickFix:
" https://github.com/sgur/unite-qf.git

" NeoMru:
" https://github.com/Shougo/neomru.vim.git
" VimFiler:
" https://github.com/Shougo/vimfiler.vim.git

" VimEmmet: {{{3
" https://github.com/mattn/emmet-vim
let g:user_emmet_install_global=0
let g:user_emmet_leader_key='<c-e>'     " <c-e>, will trigger expansion
autocmd FileType html,css EmmetInstall

" JAVASCRIPT: {{{2
let g:javascript_plugin_jsdoc = 1   " JSDOCS http://usejsdoc.org/


" Vim Configuration {{{1
" ==============================================================
" Settings {{{2
" -------------
let mapleader='\'            " its the default, use it as map <leader> ...
set nocompatible             " no vi compatible, this first! for side-effects
" set nowrap                   " don't wrap long lines to fit screen
set whichwrap=b,s,<,>,[,]    " [back]space, <left>,<right> all wrap
set sidescroll=10            " ensure some context when scrolling
set backspace=indent,eol,start  " backspace over these in insert mode
set smartindent              " autoindent new lines, for c-like programs 
set shiftwidth=4             " the python pep8 standard
set tabstop=4                " dito
set softtabstop=4            " dito
set expandtab                " use spaces, for tab press ctl-V<tab>
set history=50               " prevent large viminfo files
set textwidth=79             " will be overriden for specific file types
set formatoptions=tcrqn2j
set mouse=a                  " enable mouse in most modes
set history=50               " keep 50 lines of command line history
set number                   " show line numbers
set numberwidth=4            " line number column width
set ruler                    " show the cursor position all the time
set showcmd                  " display incomplete commands
set noshowmode               " current mode already display in statusline
set incsearch                " do incremental searching
set laststatus=2             " last window always has a status line
set showmatch                " Show matching brackets.
set ignorecase               " case insensitive matching
set smartcase                " unless if there's a Capital letter
set autowrite                " autosave before commands like :next and :make
set hidden                   " hide buffers when they are abandoned
set wildmenu                 " show cmd autocompletion in statusline
set lazyredraw               " don't redraw during macro execution
set clipboard=unnamed        " use clipboard reg-* for yank ops
set clipboard+=unnamedplus   " use clipbaord reg-+ for all y,d,c & p ops
"set clipboard+=autoselect    " visual->X11-selection (paste middle mouse button)
set list                     " show listchars for more visibility of stuff
set listchars=tab:>~,trail:-,precedes:<,extends:>  "show tabs and stuff.
set splitright               " new vsplit window to the right of curr window

au FileType vim set sts=2 sw=2 tabstop=2
" prevent weird chars in statusline while using nvim
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=
" py.path += ~/.vim/pylib {{{2
" ----------------------------
" - see also /usr/share/vim/vim7<x>/ftplugin/python.vim

" - extend python path with a vim specific pylib directory.
" - use :scrip[tnames] to list all sourced script names (1st = 1st sourced)
" - vim.eval("expand('<sfile>')")
"    `-> also gives /home/<usr>/.vimrc (ie the symlink)

python3 <<EOF
import sys
import os
DOTVIMDIR = os.path.expanduser('~/.vim')
if os.path.islink(DOTVIMDIR):
    # ~/.vim -> <some-path-to-a-vimdir>
    DOTVIMDIR = os.path.dirname(os.path.realpath(DOTVIMDIR))
l = [p for p,n,f in os.walk(os.path.join(DOTVIMDIR,'pylib'))]
sys.path.extend(l)
del os
del sys
EOF

" Spelling: {{{2
" --------------
" Thesaurus: {{{2
" ---------------

" Keymaps: {{{2
" -------------
"Use :W to write a file you opened with sudo (you'll need sudo rights)
command! W  execute 'silent w !sudo tee % % > /dev/null' | :edit!
" yank till end-of-line (like D deletes to eol)
nnoremap Y y$
" reformat paragraph, start at cursor. {Q to reformat whole paragraph
nnoremap Q gq}
" H 
nnoremap H :<c-u>tabp<cr>
nnoremap L :<c-u>tabn<cr>
" u undo, U redo
nnoremap U <c-r>
nnoremap <leader>ev :edit $HOME/.vimrc<cr>
nnoremap <leader>sv :source $HOME/.vimrc<cr>
nnoremap <leader>ed :edit /home/dta/notes/docs/breda/dwark.md<cr>
nnoremap <leader>ew :edit /home/dta/notes/work/tasks.md<cr>
nnoremap <leader>n  :cn<cr>
" aligns table using Tabular on ' | '-character (need the spaces!)
" - | symbols should be separated from text with 1+ spaces!
nnoremap <leader>t  :call TabularAlign()<cr>
" escape to normal mode
inoremap jj <ESC>
" escape to normal mode and update
inoremap hh <ESC>:update<cr>
" Alt-j as opposite of Shift-J (ie split lines instead of join lines)
" Alt key actually maps to \033 (type sed -n l, then Alt-j -> \033j
" so an alternate mapping could be nnoremap <esc>[033j i
nnoremap j i<esc>
nnoremap <F5> :redraw!<cr>
" weirdness with copy/past to/from X clipboard.
" vmap <C-c> y: call system("xclip -i -selection clipboard", getreg("\""))<CR>
" nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" Completion:
" -----------
" Use generic completion such that we can continue typing to refine the list
" Trick comes from Practical Vim
" Note the noremap!
inoremap <c-p> <c-p><c-n>|" invoke generic keyword completion & reverto current word
inoremap <c-n> <c-n><c-p>

" Keep stuff centered
" -------------------
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap <c-o> <c-o>zz
nnoremap <c-i> <c-i>zz
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz
nnoremap g, g,zz
nnoremap g: g;zz
" open url even if quouted 'http://www.google.nl'
" nnoremap ww <plug>NetrwBrowseX("<cfile>")

" Voom
" ----
nnoremap <silent> <leader>v :call My_Voom_Toggle()<cr>
" JK move down/up w/ select by (re)mapping onto <down>/<up>
au FileType voomtree nmap <silent><buffer>J <down>
au FileType voomtree nmap <silent><buffer>K <up>


" turnoff highlighted search
nnoremap <c-n> :nohl<CR>

" Ctl-jhklp move up/left/down/right/previous window
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap <c-p> <c-w>p

" <c-s> to write buffer if it's been modified (ie :update instead of :write)
" Requires the terminal to give up its claim on <c-s> via stty -ixon
" Or use a .bashrc function to call vim which toggles this, see
" http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files
" <c-S> is seen as <c-s>? Dunno how this happens ..
inoremap <c-s> <esc>:update<CR>
nnoremap <c-s> <esc>:update<CR>

" Tlib:
" ----
" Whenever we use tlib#input#List{,DW} and see the tlibInputList window, 
" we want a few things different

augroup TLIBPDH
    autocmd!
    "autocmd FileType tlibInputList call PdhTlibInfo()
    autocmd FileType tlibInputList setlocal nocursorline
    autocmd FileType tlibInputList setlocal nonumber
    autocmd FileType tlibInputList setlocal listchars=precedes:<,extends:>
    autocmd FileType tlibInputList syntax match InputlListNormal /.*$/
    autocmd FileType tlibInputList :echom "FileType " . &ft
    autocmd FileType tlibInputList :echom "cursorline setting " . &cursorline
augroup END

hi link InputlListIndex      LineNr      " tlib's index of each line
hi link InputlListCursor     CursorLine  " the current line
hi link InputlListSelected   Conceal     " a selected line
hi default link InputlListNormal Comment     " a normal line
hi default link hl_nth_word  WildMenu    " highlight single word

" TToC:
" ----
"let g:ttoc_vertical = 0  " ttoc opens under current window
"let g:tlib_viewline_position = 'z.'
" TTOC's default regex for asciidoc filetypes.
" - include headers starting with ='s
" - as well as actions defined i/t the text
" - any leading non-text (whitespace and comment signs) are ignored here
"   (this is different in .vimrc's rgx's used for ,a/,A/,o/,x)
"let g:ttoc_rx_asciidoc = '^\(=\+.*\|["/#[:blank:]]*\s*[oOxXcC]\s.*\)'
" ,t run default TToC (filetype specific) rgx on current file
" ,w run TToC for current word under cursor
" ,A all actions (oxcp) from this dir and down in all files
" ,a all actions in this file (oxcp)
" ,o all open actions in this file (op)
" ,x all closed actions in this file (xc)
" In the TToC jump list:
"  up/down for up/down i/t list
"  c-k/c-j for up/down with preview
"  <cr> jumps to item and closes the list
"      < jumps to item
"  <c-p> preview item
" After jumping:
" <c-o> takes you backwards to where you were.
" <c-i> takes you forward again
" Actions: o(pen), x(closed), c(cancelled), p(lanned)
"nnoremap <silent> <leader>A :TToC ^["/#[:blank:]-]*\s*[oOxXcC]\s.*$<CR>
nnoremap <silent> <leader>f :LAg! -Qi shellescape(expand('<CWORD>'),1)<CR>
nnoremap <silent> <leader>F :LAg! -Qi fnameescape(expand('<CWORD>'))<CR>
nnoremap <silent> <leader>A :LAg! '^\s*[ox]\s' *.txt<CR>
"nnoremap <silent> <leader>a :TToC ^["/#[:blank:]-]*\s*[oxcp]\s.*$<CR>
"nnoremap <silent> <leader>a <esc>:TToC ^\(=\+\\|[ox]\)\s\+\S.*<CR>
"nnoremap <silent> <leader>o :TToC ^["/#[:blank:]-]*\s*o\s\+\S.*<CR>
"nnoremap <silent> <leader>x :TToC ^["/#[:blank:]-]*\s*x\s\+\S.*<CR>
"nnoremap <silent> <leader>w :TToC! .*<c-r><c-a>.*<cr>
"nnoremap <silent> <leader>t :TToC<CR>
nnoremap <f8> :echom 'line ' . line(".") . ' -> hi <' . synIDattr(synID(line("."),col("."),1),"name") . '>, transparent<' . synIDattr(synID(line("."),col("."),0),"name") . '>, local<' . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . '>'<CR>
" browse output of a command, typing filters directly, ESC takes you back
nnoremap <F9> :call tlib#cmd#BrowseOutput(input('Browse which command: '))<CR>

" UltiSnips:
" ----------
" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Sontek: Use tab to scroll through autocomplete menus
autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<tab>"
autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<s-tab>"
" easier nav of previewmenu j=down, k=up, space selects
" o todo, down have j/k in insert mode mean anything to YMC!
"autocmd VimEnter * imap <expr> j pumvisible() ? "<C-N>" : "j"
"autocmd VimEnter * imap <expr> k pumvisible() ? "<C-P>" : "k"
" Sontek: in select mode, c-j triggers snippet expansion

" NeoSnippets:
imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<TAB>" : "\<Plug>(neosnippet_expand_or_jump)"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" Taglist:
nnoremap <silent> <leader>/ :TlistToggle<CR>

" Utl:
nnoremap <silent> <leader>g :Utl<CR>:redraw!<CR>

" Bufexplorer:
nnoremap <silent> <leader>l :BufExplorer<CR>
" Pydoc:
" + https://github.com/fs111/pydoc.vim.git
" - use K on a python keyword.
" - <leader>pw for help on word (the os in os.path)
" - <leader>pW for help on WORD (whole of os.path)
" NOTE: howto remove xfce4-terminal <F1> keyboard shortcut
"       so it actually reaches Vim.
" 1) $> xfce4-appearance-settings
" 2) select tab: Settings 
" 3) and enable 'Enable editable accelerators
" 4) close xfce4-appearance-settings
" 5) in xfce4-terminal, click Help
" 6) hover over "Contents" -> press delete 
"    => f1 now dissapears as keyboard shortcut for terminal-help
au FileType python nnoremap <f1> <esc>:normal <leader>pW<CR>

" Pep8:
let g:pep8_map=",8"
" Pylint: make python file open quickfix window
au FileType python map <leader>m <esc>:make<cr><cr><cr>:cw<cr><cr>

" Ack:
" noremap <leader>G <esc>:Ack!
" nnoremap <leader>A AckGrep

" Easy quit nofile-like windows
augroup QuitNoFile
  au!
  " Note: sometimes buftype gets set after the bufenter event
  au bufenter * if &buftype=='nofile'|nnoremap <buffer> q <esc>:q<cr>|endif
  au FileType nofile nnoremap <buffer> q <esc>:q<cr><c-w>p
  au syntax * if &buftype=='nofile'|nnoremap <buffer> q <esc>:q<cr>|endif
  au syntax * if &syntax == 'man'|nnoremap <buffer> q <esc>:q<cr>|endif
  au syntax * if bufname('%')=='__doc__'|nnoremap <buffer> q <esc>:q<cr>|endif
  au syntax * if bufname('%')=='[Scratch]'|nnoremap <buffer> q <esc>:q<cr>|endif
  " unite's buftype=='nofile', but :q would also quit vim if -no-split was used
  "  - so set q to UniteClose in this case.
  au syntax * if &filetype=='unite'|nnoremap <buffer>q :UniteClose<cr>|endif
augroup end

" fonts:
" - monaco, consolas have slashed zeros. Ubuntu mono a dotted zero
"
" italic fonts?
" `-> pandoc-syntax tries to highlight stuff with hi-groups that have cterm=italic 
"     but that comes out horrible in some sort of reverse video.. yuk!
" bash$ echo "\e[3m foo \e[23m"  does not echo foo in italics in xfce4-terminal
" - no italics in xfce4-terminal
" - works in gnome-terminal
set t_ZH=[3m     " terminal code for: italics mode (i.e. start italics)
set t_ZR=[23m    " terminal code for: italics end

" Space Keymap: {{{3
" Notes:
" - use <enter> to enter a directory, use q to go back (up)
" - lowercase = withbufferdir, uppercase = currentworkingdir
" Nagivation:
" q (w/o space) returns to previous unite buffer (e.g. prev directory)
" 2x<space> resume last unite buffer
" n UniteNext
" N UnitePrevious
" Find Files:
" f browse for files, from current buffer dir
" F browse for files, from project root dir.
" p filter file-list, start at project root dir, honor .gitignore
" P filter file-list, start at project root dir, ignore .gitignore
" r same as p
" R same as P
" Grep Files:
" g grep for <pattern> in files under project root dir
" G same as g
" Find Buffers:
" b - to list buffers
" B - to list ALL buffers
" Find In Buffers:
" <space>+<letter>
" a find [ox] items in buffer
" l filter lines in buffer, type filter yourself
" d filter with yyyy-mm-dd for today
" m filter with yyyy-mm for this month
" o filter for markdown headers & open actions (see hierarchy + open items)

" Navigation: {{{3
nnoremap <space><space> :<c-u>UniteResume<cr><esc>
nnoremap <space>n :UniteNext<cr><esc>zz
nnoremap <space>N :UnitePrevious<cr><esc>zz

" Find Files: {{{3
nnoremap <space>f :<C-u>UniteWithBufferDir -no-split file<cr>
nnoremap <space>F :<C-u>Unite -no-split file<cr>
nnoremap <space>p :<C-u>UniteWithProjectDir -no-split -start-insert file_rec/async:!<cr>
nnoremap <space>P :<C-u>UniteWithProjectDir -no-split file_rec<cr><c-l>
nnoremap <space>r :<C-u>UniteWithBufferDir -no-split -start-insert file_rec/async:!<cr>
nnoremap <space>R :<C-u>Unite -no-split -input= -start-insert file_rec/async:!<cr>

" Grep Files: {{{3
" see https://github.com/Shougo/unite.vim/issues/280
" grep:arg1:arg2:arg3
" - arg1 = file/directory
" - arg2 = ag options (or other grep command)
" - arg3 = pattern
nnoremap <space>g :<C-u>Unite -no-split -silent -buffer-name=unite-ag grep:.<cr>
nnoremap <space>G :<C-u>Unite -no-split -silent -buffer-name=unite-ag grep:.<cr>

" search tags lines in markdown files
" - <space>t for tag-lines under current dir
" - <space>T for tag-lines under /home/www/notes
nnoremap <space>t :<C-u>Unite -no-split -silent -buffer-name=unite-ag -start-insert grep:.:--markdown:^(tags\|title\|subject\|categories)<cr>
nnoremap <space>T :<C-u>Unite -no-split -silent -buffer-name=unite-ag -start-insert grep:/home/www/notes:--markdown:^(tags\|title\|subject\|categories)<cr>

" Find Buffers: {{{3
nnoremap <space>B :<C-u>Unite -no-split buffer:!<cr>
nnoremap <space>b :<C-u>Unite -no-split buffer<cr>

" Find In Buffers: {{{3
nnoremap <space>a :<C-u>Unite -input=\v\c^(#+\|\=+\|\s*o\|\s*x) line<cr>
nnoremap <space>l :<C-u>Unite -no-split -start-insert line<cr>
nnoremap <space>w :<C-u>UniteWithCursorWord line<cr>
nnoremap <space>W :exec 'Unite -input='.expand("<cWORD>").' line'<cr>

nnoremap <space>d :exec 'Unite -input='.strftime("%Y-%m-%d").' line'<cr>
nnoremap <space>m :exec 'Unite -input='.strftime("%Y-%m").' line'<cr>
nnoremap <space>o :exec 'Unite -input=\v\c^(#+\|\=+\|\s*o) line'<cr>

" Comment Stuff: {{{3
vnoremap ,b !boxes -d peek<CR><S-V>}k:!boxes -d pound-cmt<CR>}
vnoremap ,B !boxes -d peek<CR>}

" Colors: {{{2
" ------------
if &t_Co > 2 || has("gui_running")
  set hlsearch               " highlight search
  set background=dark
  set t_Co=256
  colorscheme spacegray
  syntax on                  " syntax highlighting
  set cursorline             " highlight current line
  highlight CursorLine  ctermbg=234
  highlight ColorColumn ctermbg=DarkGrey ctermfg=white
  call matchadd('ColorColumn','\%81v', 100) " only color 81st column
  hi Pmenu    term=None cterm=italic ctermfg=lightgrey ctermbg=darkgrey "250 ctermbg=10
  hi PmenuSel term=None cterm=italic ctermfg=lightgrey ctermbg=darkblue
  hi LineNr ctermfg=239 ctermbg=234
endif

augroup OnColorScheme
  au!
  autocmd ColorScheme * hi Comment cterm=italic
augroup END

if has("gui_running")
    " gui seems slow, turn some stuff off
    "set nowrap
    colorscheme spacegray
    set scrolljump=5
    set noshowcmd
endif

" Statusline: {{{2
" ----------------
" - define custom colors, so this goes after call to colorscheme
" See http://www.vim.org/scripts/script.php?script_id=3412
" Dld'd to ~/Downloads/vim/xterm-color-table
hi User1 ctermfg=15   ctermbg=88         " modified/RO flags
hi User2 ctermfg=190  ctermbg=65         " [filetype]
hi User3 ctermfg=190  ctermbg=65 cterm=italic  " (fugitive#head)
hi User4 ctermfg=190  ctermbg=65         " [MODE]
hi StatusLine  ctermfg=251 ctermbg=241   " 0     " The current window
hi StatusLineNC ctermbg=242 ctermfg=249 "ctermbg=242  " inactive window greyed out
au InsertEnter * hi User3 ctermbg=65 ctermfg=190 cterm=italic
au InsertEnter * hi User4 ctermbg=190 ctermfg=65
au InsertLeave * hi User3 ctermbg=65 ctermfg=190 cterm=none
au InsertLeave * hi User4 ctermbg=65 ctermfg=190 cterm=none

"augroup toggle_cursorline
"  au!
"  autocmd WinEnter * set cursorline
"  autocmd WinLeave * set nocursorline
"augroup END

"# echo fugitive#extract_git_dir('.') -> full path to root .git dir
"# echo fnamemodify(fugitive#extract_git-dir('.'),":p:h") -> relative to cur dir
"use expand('%:p') to make it relative to current buffer's filename
function! SL_git_info() abort
    if !exists('b:git_dir')
        return ''
    endif
    let info= fnamemodify(b:git_dir,':h:t')
    let info.= "(" . fugitive#head() . ")"
    "return fnamemodify(b:git_dir,':h:t') . " (" . fugitive#head() . ")"
    return info
endfunction


set statusline=""                              " start out blank
set statusline+=%2*                            " normal color for opening [
set statusline+=%4*\                           " MODE color (changes on insert) 
set statusline+=%{mode()==?'n'?'NORMAL':''}    " mode
set statusline+=%{mode()==?'i'?'INSERT':''}
set statusline+=%{mode()==?'v'?'VISUAL':''}
set statusline+=%2*\                           " normal color ] [
set statusline+=[%{toupper(&ft)}]              " * file type
set statusline+=\ %{SyntasticStatuslineFlag()}
set statusline+=\ %{SL_git_info()}             " current git repo name
set statusline+=%2*\                           " - switch to User1 (see :hi)
set statusline+=%1*%{&modified?'+':''}         " * +  flag (no leading ,)
set statusline+=%{&readonly?'!!':''}           " * !! flag (not 'RO')
set statusline+=%*                             " - switch back to default colors
set statusline+=\ #%n                          " * buffer number
set statusline+=\ %F                           " * full filename
set statusline+=%=                             " right align
set statusline+=%l:%c                          " line(Lines):column
set statusline+=\ \ %02p%%                     " at approx. perc through the file
set statusline+=\ \ %{&encoding}               " * file encoding
set statusline+=\ [%{&fileformat}]

" Filetypes: {{{2
" ---------------
filetype plugin indent on
if has("autocmd")
  augroup vimrcEx
  au!
  autocmd FileType text setlocal textwidth=78

  " try moving to last known cursor position upon re-editing a file
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
  augroup END

  " confg filetype for Voom's confg outline mode
  augroup filetypedetect
  au BufNewFile,BufRead *confg set ft=confg
  au BufNewFile,BufRead *confg.txt set ft=confg
  au BufNewFile,BufRead *.asy set ft=asy
  au BufNewFile,BufRead *.csv set ft=csv
  augroup END
  autocmd FileType csv setlocal textwidth=0

  augroup ruby
    " set ruby indentation to two spaces
    au!
    " keywordprog is already set to ri (ruby info) by vim-ruby
    autocmd FileType ruby setlocal sw=2 ts=2 sts=2 expandtab "kp=ri
    autocmd FileType ruby let b:dispatch='ruby %'
    autocmd FileType ruby nnoremap <buffer><f1> :<c-u>call RunShellCommand('ri -f markdown -w 80 ' . expand("<cword>"))<cr>
    autocmd FileType ruby nnoremap <buffer><f4> :<c-u>call ShellCmdTab('ri -f markdown -w 80 ' . expand("<cword>"))<cr>
    autocmd FileType ruby nnoremap <buffer><f3> :<C-u>call RunShellCommand('ruby %')<cr>
    "Dispatch puts the result in quickfix window
    autocmd FileType ruby nnoremap <buffer><S-f3> :<c-u>call Dispatch 'ruby -l %'<cr>
  augroup END

endif "has("autocmd")


" Vimproc:
" https://github.com/Shougo/vimproc.vim.git
" Requires manual make/install after cloning/update
" #do --
" cd ~/.vim/bundle/vimproc.vim/
" make
" #-- done
" Enables asynchronous operations, e.g. by Unite
"
" Tlib:
" https://github.com/tomtom/tlib_vim.git bundle/tlib
" - prerequisite for Tom Link's plugins.

" Ttoc:
" https://github.com/tomtom/ttoc_vim.git bundle/ttoc
" You can set: w:ttoc_rx, b:ttoc_rx or g:ttoc_rx_{&filetype}
" ttoc popup on bottom/below current window because width is too small.
let g:ttoc_vertical = 0
" 1) TToC<CR> uses the file type specific default rx.
" 2) TToC uses tlib, <c-j>,<c-k> = Up/Down with active preview
" 3) ,A shows all actions defined in the file
" 4) ,a/,x only the open/closed ones
" 5) ,t shows a ttoc based on a file specific rgx, pretty handy

" Ttags:
" o https://github.com/tomtom/ttags_vim.git

" Finding Files: {{{2
" --------------

" BufExplorer:
" https://github.com/jlanzarotta/bufexplorer
let g:bufExplorerShowUnlisted=1      " Show unlisted buffers.

" Taglist:
" via random github repo mirror for:
"  http://www.vim.org/scripts/script.php?script_id=273
" (use :help taglist.txt (ie add .txt because taglist exists as func as well)
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Close_On_Select  = 0
let g:Tlist_GainFocus_On_ToggleOpen = 1

" Utl:
" https://github.com/vim-scripts/utl.vim.git
" gx goto url under cursor / open url in browser
" gf goto file under cursor

" Ag:
" --------------------------------------------------------------
" https://github.com/ggreer/the_silver_searcher
" Usage:
" :Ag [options] {pattern} [{directory}] - search recursively
" :h AG                       - help on Ag
" :AgAdd                      - adds results to existing qf list
" :LAg                        - puts results in location list
" :LAgAdd                     - adds reulsts to existing location list

" + sudo apt-get install ack-grep
" - see ack-grep --help-types for --[NO]TYPES
"   :Ack! map --vim --python (looks for map in vim python files recursively)
"   :Ack! map %              (look in current buffer only)
" - :Ack! [options] pattern [filetypes], noteworthy options:
"   -i case insensitive
"   -v invert match
"   -w pattern forced to match whole words
"   -n no recurse into subdirs
"   -G rgx  search only files matching rgx
"   --[no]follow   follow symlinks (default is off)
" Ack:
"let g:ackprg = "ack-grep -H --nocolor --nogroup --column"
"command! -nargs=1 AckGrep Ack! "<args>"

" FuzzyFinder:
" See https://github.com/vim-scripts/FuzzyFinder.git
"let g:fuf_enumeratingLimit = 450
"let g:fuf_mrufile_maxItem = 400
"let g:fuf_mrucmd_maxItem = 400

" IncSearch: {{{2
" https://github.com/haya14busa/incsearch.vim
" CodeSearch:
" Russ Cox's Google Code project.  
" "CommandT:
" Plugin 'wincent/Command-T.git'
" always find all files in any directory in/below current dir.
"let g:CommandTAlwaysShowDotFiles = 1

" Editing: {{{2
" -------------

" Surround:
" See :help surround
" Notes:
" - (),{},[],<> represent themselves + counterpart.  Use opening mark to add
"   a space between mark and text. Closing marks to just change the marks.
"
" ds<t>          - delete surrounding <t>-marks target to delete
" cs<t1><t2>     - change surroundings from t1 to t2
" ys{motion}<t2> - surround with t2
" <paa>sd[fsfd]</paa> 'sdf sdf'

" EasyMotion:
" https://github.com/Lokaltog/vim-easymotion.git
" <leader><leader>f<char> works wonders.

" Tgpg:
" https://github.com/tomtom/tgpg_vim.git
" see also after/ftplugin/asciidoc.vim for pwd vault

" Tabular:
" https://github.com/godlygeek/tabular.git
" https://gist.github.com/tpope/287147
inoremap <silent> <Bar>   <Bar><Esc>:call TabularAlign()<CR>a

function! TabularAlign()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Completion: {{{2
" -----------
" Use deoplete (NVIM only).
if has("nvim")
  " NeoComplete (VIM only)
  let g:deoplete#enable_at_startup = 1
else

  let g:acp_enableAtStartup=0
  let g:neocomplete#enable_at_startup=1
  let g:neocomplete#enable_smart_case=1
  let g:neocomplete#sources#syntax#min_keyword_length=3
  let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
  let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
          \ }

  let g:neocomplete#sources#omni#functions = {}
  if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns['default'] = '\h\w*'

  " Enable heavy omni completion.
  if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
  endif
  "let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
  "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
  "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

  " JavaScript JS
  " https://davidosomething.com/blog/vim-for-javascript/
  " https://github.com/Shougo/neocomplete.vim
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  let g:neocomplete#sources#omni#functions.javascript = [
        \   'tern#Complete',
        \ ]
"        \   'jspc#omni',

  " PERL For perlomni.vim setting.
  " https://github.com/c9s/perlomni.vim
  let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
  " AutoComplPop like behavior.
  "let g:neocomplete#enable_auto_select = 1

  "let g:neocomplete#enable_auto_select = 1
  "let g:neocomplete#disable_auto_complete = 1

  " Plugin key-mappings.
  inoremap <expr><C-b> neocomplete#undo_completion()
  inoremap <expr><C-l> neocomplete#complete_common_string()
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"

endif


" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"


" Shell like behavior(not recommended).
"set completeopt+=longest
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags



" Programming: {{{2
" -----------------
" Syntastic:
" https://github.com/scrooloose/syntastic
" :SyntasticInfo<CR>   -> shows available checkers for current file(type).
" :SyntasticCheck<CR>  -> manually check
" :SyntasticToggleMode -> switch between active/manual
" :Erros               -> opens location list
let g:syntastic_always_populate_loc_list = 1  " use location list
let g:syntastic_auto_loc_list = 0             " donot auto open loclist
let g:syntastic_check_on_open = 0             " no checks on open/save events
let g:syntastic_check_on_wq = 0               " no check on quit
let g:syntastic_cursor_column = 0             " only 1st error on line
let g:syntastic_stl_format='%E{e%e}%B{|}%W{w%w}'
let g:syntastic_error_symbol = "e"
let g:syntastic_warning_symbol = "w"
let g:syntastic_loc_list_height = 15          " make lots of mistakes
let g:syntastic_ignore_files = ['\v^/usr']    " don't check these
let g:syntastic_python_checkers = ['flake8']  " pylint is too slow
" See ~/.pylintrc, and look for 'tmpdh' to see what changed
" - <leader>m will 'make' the py program using pylint

" Match-up superseeding matchit:
" - see also ftplugin/python_match.vim for py-specific matching
" - out of the box, it doesn't support Python in any way
" - you can let b:match_words = 'if:else' to add match words to '%' behaviour
" Fugitive:
" https://github.com/tpope/vim-fugitive.git
"[2015-01-03 12:06:03] Plugin tpope/vim-fugitive.git
"[2015-01-03 12:06:03] $ git clone --recursive 'https://github.com/tpope/vim-fugitive.git' '/home/pdh/.vim/bundle/vim-fugitive'
"[2015-01-03 12:06:03] > Cloning into '/home/pdh/.vim/bundle/vim-fugitive'...
"[2015-01-03 12:06:03] :helptags /home/pdh/.vim/bundle/YouCompleteMe/doc

" Python:
" Python Syntax:
" https://github.com/hdima/python-syntax.git
" - is gitrepo for http://www.vim.org/scripts/script.php?script_id=790
let python_highlight_all = 1
let python_version_2 = 0

" Pep8:
" + sudo apt-get install pep8
" See https://github.com/hynek/vim-python-pep8-indent.git
" See https://github.com/vim-scripts/pep8.git
let g:pep8_map='<leader>8'

" Pydoc:
" https://github.com/fs111/pydoc.vim
let g:pydoc_open_cmd = 'botright vsplit'   " help to the right
let g:pydoc_window_lines=1.0               " new tab, so full window
let g:pydoc_use_drop=1                     " re-use a help tab/window

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultComletionType="context"
set completeopt=menuone,longest,preview

" Python Matcher:
" https://github.com/yegle/python_match.git
" Enhanced motion for python files
" % moves between if/elif/else, try/except/catch, {for,while}/continue/break
" [%,]% moves across blocks
"
augroup PyLint
    " pylint3 error output format string: see: https://docs.pylint.org/en/1.6.0/output.html
    au!
    au FileType python set makeprg=pylint3\ -rn\ -ftext\ --msg-template='{path}:{msg_id}:{line}:{column}:{msg}'\ %:p\ \\\|\ grep\ \-Ev\ '^\\*'
    au FileType python set efm=%f:%t%n:%l:%c:%m,*%#\ %#%m
augroup end

" "Go Lang:
" https://github.com/fatih/vim-go
" Make sure:
" - go binaries are installed (gocode,godef,goimports etc)
" - set go envars (GOPATH, GOBIN, etc..)
" Install binaries with :GoInstallBinaries
" Install plugin with :PluginInstall

" Completion:
" ==============================================================
" Acp: old?
" let g:acp_completeoptPreview=1
" needs additional install steps
" $ cd ~/.vim/YouCompleteMe
" $ ./install.sh --clang-completer --omnisharp-completer

" YouCompleteMe: {{{2
" let g:ycm_always_populate_location_list = 1
" let g:ycm_autoclose_preview_window_after_completion=1
" nnoremap <leader>jg :YcmCompleter GoToDefinitionElseDeclaration<CR>


"
" Pandoc: {{{2
" ==============================================================
" ----------------------------------------------------------------
" Vim Pandoc:
" https://github.com/vim-pandoc/vim-pandoc.git
let g:pandoc#formatting#mode="ha"
let g:pandoc#formatting#textwidth=79
" Pandoc Syntax:
" https://github.com/vim-pandoc/vim-pandoc-syntax.git
" see also ~/.vim/after/syntax/pandoc.vim

" Pandoc After:
" https://github.com/vim-pandoc/vim-pandoc-after.git
let g:pandoc#syntax#conceal#use = 0    " almost choked on my coffee here
let g:pandoc#syntax#conceal#urls = 0   " just to be sure, no monkey business
let g:pandoc#syntax#style#underline_special = 0
let g:pandoc#hypertext#preferred_alternate="mkd"
let g:pandoc#syntax#codeblocks#embeds#use = 1

let g:pandoc#syntax#codeblocks#embeds#langs = ["python","bash=sh","c","sh"]
let g:pandoc#spell#enabled = 0                       " default is on .. wtf??
let g:pandoc#modules#disabled = ["folding"]          " got Voom for that
let g:pandoc#command#custom_open = "Pandoc_xdg_open" " How Pandoc! opens files
let g:pandoc#command#use_message_buffers=1
let g:pandoc#after#modules#enabled = ["ultisnips", "unite"]
let g:pandoc#command#latex_engine = "pdflatex"

fun! Pandoc_xdg_open(file) " custom open func for g:pand#command#custom_open
  return "xdg-open " . a:file
endf

augroup auPandoc
    au!
    autocmd FileType pandoc set formatoptions="want"
    " autocmd FileType pandoc let &makeprg="~/bin/mk.notes %"
    "   makeprg is setup via vim-pandoc's compiler 
    "   see ~/.vim/after/compiler/pandoc.vim, where a proper makeprg is set
    "   this method does not need the ~/bin/mk.notes shell script.
    " <S-F4> - to compile the current markdown buffer to pdf
    " <F4> - to compile & preview the current markdown buffer in evince
    autocmd FileType pandoc nnoremap <buffer><S-F4> <esc>:silent make\|redraw!\|copen<cr>
    autocmd FileType pandoc nnoremap <buffer><F4> <esc>:silent make\|redraw!\|call vimproc#system_bg("evince ".expand("%:r").".pdf")<cr>
    autocmd FileType pandoc compiler pandoc
augroup END

augroup auDot
  au!
  autocmd FileType dot set formatoptions="want"
    autocmd FileType dot nnoremap <buffer><F4> <esc>:silent \|call vimproc#system_bg("dot -Tpng ".expand("%")."\| display")<cr>
augroup END

" Colors: {{{2
" ------------
" SpaceGray:
" Matt Wozinsky - https://github.com/godlygeek
" Also has csapprox to approx a gvim colorscheme
" ColorChart:
" https://github.com/godlygeek/colorchart.git
" :ColorChart
" :he ColorChart

" Misc: {{{2
" ----------
let g:netrw_browsex_viewer= "xdg-open"

" Scratch Stuff: {{{2
" -------------------
" DialK: {{{3

" don't have csscomplete?
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS


fun! UniteToday()
  let tday = strftime("%Y-%m-%d")
  echomsg 'today is' . tday
  let cmd = ':Unite -input='.tday.' line'
  exec cmd
endfun

hi! link PandocTitleBlockTitle Identifier

" Run a script, capture output in scratch buffer.
command! -complete=shellcmd -nargs=+ Shell call RunShellCommand(<q-args>)
function! RunShellCommand(cmdline)
  "echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  " set q to quit the scratch buffer & return to previous window (previous position)
  nnoremap <buffer><silent>q :<c-u>q<cr><c-w>p
  call setline(1, a:cmdline . ' ~> ' . expanded_cmdline . ' :')
  call setline(2,substitute(getline(1),'.','=','g'))
  call setline(3,'')
  execute '$read !'. expanded_cmdline . ' 2>&1'
  " surround possible headerlines with empty lines
  silent g/^#/ s/^\|$//g
  " when used for ri <method>, reduce verbosity of "Implemenation from <class>"" headers
  " this is Ruby stuff, I know... perhaps check first is a:cmdline =~ 'ri' ...
  silent g/Implementation from/s///
  nohl
  setlocal nomodifiable
  setlocal ft=pandoc
  1
endfunction

command! -complete=shellcmd -nargs=+ Shell call ShellCmdTab(<q-args>)
function! ShellCmdTab(cmdline)
  "echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  tabnew
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  " set q to quit the scratch buffer & return to previous window (previous position)
  nnoremap <buffer><silent>q :<c-u>q<cr><c-w>p
  call setline(1, expanded_cmdline . ' ~>')
  "call setline(2,substitute(getline(1),'.','=','g'))
  call setline(2,'')
  execute 'silent $read !'. expanded_cmdline
  " surround possible headerlines with empty lines
  silent g/^#/ s/^\|$//g
  " when used for ri <method>, reduce verbosity of "Implemenation from <class>"" headers
  " this is Ruby stuff, I know... perhaps check first is a:cmdline =~ 'ri' ...
  silent g/Implementation from/s///
  nohl
  setlocal nomodifiable
  setlocal ft=pandoc
  normal \v
  1
endfunction

function! TabCmd(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "no output"
  else
    " use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    call setline(1, a:cmd . ' ~>')
    call setline(2, '')
    call setline(3, '--')
    normal gg
    " silent normal nohl " <- causes errmsg is nothing was highlighted
    silent put=message
  endif
  nnoremap <buffer><silent>q :<c-u>q<cr><c-w>p
endfunction
command! -nargs=+ -complete=command Show call TabCmd(<q-args>)
