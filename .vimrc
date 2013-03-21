"===============================================================================
"
" VIMRC
" Author: Luke Cycon
" Version: 2011.08.02.01
"===============================================================================

fun! MySys()
    return "linux"
endfun

"===============================================================================
" Variables
"===============================================================================

" Set 'no compatable' to ward off unexpected things that your distro might have
" made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Enable error files & error jumping. 
set cf

" Mouse
set mouse=a

" Yanks go on clipboard instead
set clipboard+=unnamed

" Beter command-line completion
set wildmode=longest:full
set wildmenu

" Allow backspacing over autoindent, linebreaks and start of insert actions
set backspace=indent,eol,start

" No more error bells
set noerrorbells

" Reset the terminal code for the visual bell. If the visualbell is set and this
" line is also included, vim will neither flash nore beep, if visualbell is
" unsel, this does nothing
set t_vb=

" fix backspacing in insert mode
set bs=2

" Line Wrapping
set nowrap

" Wrap a word
set linebreak 

" Autoindenting
set ai
set si

" set background
set background=dark

" Status Line
"if has('statusline')
"    set laststatus=2
"    set statusline+=\ [%{getcwd()}]
"    set showcmd
"    set ruler
"    set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%{exists('g:loaded_fugitive')?fugitive#statusline():''}%{exists('g:loaded_rvm')?rvm#statusline():''}%=%-16(\ %l,%c-%v\ %)%P
"endif
set rtp+=/Users/lukecycon/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
let g:Powerline_theme="skwp"
let g:Powerline_colorscheme="skwp"
let g:Powerline_symbols = 'fancy'

"Default file types 
set ffs=unix,dos,mac

"Setup pathogen
call pathogen#infect()

"===============================================================================
" Formatting Options
"===============================================================================

behave xterm
set termencoding=utf-8

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto indenting for each filetype, and
" for plugins that are filetype specific
filetype indent plugin on



"===============================================================================
" Display
"===============================================================================

" 256 colors
set t_Co=256

" Syntax highlighting
syntax on 

" Set font according to system
if MySys() == "mac"
    set gfn=Menlo:h14
    set shell=/bin/bash
elseif MySys() == "windows"
    set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif MySys() == "linux"
    set gfn=m+\ 2m\ regular\ 11
    set shell=/bin/bash
endif

"  line numbers
set nu

" text wrapping
setlocal textwidth=0

" Set Color Scheme
colorscheme solarized

"===============================================================================
" Searching
"===============================================================================

" Highlight searches (use <C-L> to temporarily turn off highlighting
nnoremap <C-L> :nohl<CR><C-L>
set hlsearch

" Incremental search, search as you type
set incsearch

" Ignore case when searching
"set ignorecase

" Ignore case when searching lowercase
set smartcase

"==========================================================================
" Tag browsing
"==========================================================================

let g:tagbar_usearrows = 1
nnoremap <leader>l :TagbarToggle<CR>

"==========================================================================
" General
"==========================================================================

set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

"==========================================================================
" JAVA
"==========================================================================

autocmd Filetype java setlocal omnifunc=javacomplete#Complete

"================================================================================
" Scala
"===============================================================================

" Expand tabs in C with spaces
au BufRead,BufNewFile *.{scala,spde} set filetype=scala

"================================================================================
" GIT
"===============================================================================

" Expand tabs in C with spaces
au BufRead,BufNewFile *new-commit set filetype=gitcommit
au BufRead,BufNewFile *differential-update-comments set filetype=gitcommit

"================================================================================
" C/C++/Java
"===============================================================================

" Expand tabs in C with spaces
au BufRead,BufNewFile *.{c,h,java} set expandtab
au BufRead,BufNewFile *.{c,h,java} set shiftwidth=4

" ==========================================================================="
" RUBY
" ==========================================================================="
au BufRead,BufNewFile *.{ruby,rb} set tabstop=2
au BufRead,BufNewFile *.{ruby,rb} set expandtab
au BufRead,BufNewFile *.{ruby,rb} set shiftwidth=2

" ==========================================================================="
" Python
" ==========================================================================="
au BufRead,BufNewFile *.{py} set tabstop=4
au BufRead,BufNewFile *.{py} set expandtab
au BufRead,BufNewFile *.{py} set shiftwidth=4
au BufRead,BufNewFile *.{py} set softtabstop=4

"==============================================================================
" Assembly
"==============================================================================

" Do not expand tabs in assembly file. Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8

"==============================================================================
" JavaScript/HTML/CoffeeScript
"==============================================================================

au BufRead,BufNewFile *.{js,html,coffee} set smartindent
au BufRead,BufNewFile *.{js,html,coffee} set tabstop=2
au BufRead,BufNewFile *.{js,html,coffee} set shiftwidth=2
au BufRead,BufNewFile *.{js,html,coffee} set expandtab
au BufRead,BufNewFile *.{html} imap <Tab> <C-E>

"==============================================================================
" Markdown
"==============================================================================

au BufRead,BufNewFile *.{md} set smartindent
au BufRead,BufNewFile *.{md} set tabstop=4
au BufRead,BufNewFile *.{md} set shiftwidth=4
au BufRead,BufNewFile *.{md} set expandtab

"==============================================================================
" Haskell
"==============================================================================

au BufRead,BufNewFile *.{hs,lhs} set smartindent
au BufRead,BufNewFile *.{hs,lhs} set tabstop=4
au BufRead,BufNewFile *.{hs,lhs} set shiftwidth=4
au BufRead,BufNewFile *.{hs,lhs} set expandtab
au BufRead,BufNewFile *.{hs,lhs} setlocal omnifunc=necoghc#omnifunc
let g:haskell_tex = 0
let g:haskell_unicode = 0

"==============================================================================
" Mappings
"==============================================================================

let g:syntastic_mode_map = { 'mode': 'passive' }

" Shortcut to home directory
cnoremap $h e ~/
" Shortcut to workspace directory
cnoremap $w e ~/Projects
" Shortcut to .vimrc
cnoremap $v e ~/.vimrc

" Map NERDTree
map <F2> :NERDTreeToggle<CR>

" Map Command-T
noremap <leader>t :CommandT<CR>
noremap <leader>b :CommandTBuffer<CR>

" Add a fast mapping to keyword complete
inoremap <C-Space> <C-X><C-O>
imap <C-@> <C-Space>

" Map <C-L> (redraw screen) to also turn off search highlighting until the next
" search
noremap <C-L> :nohl<CR><C-L>
set sm

" Movement
map <up> gk
map k gk
imap <up> <C-o>gk
map <down> gj
map j gj
imap <down> <C-o>gj
map E ge

"=========================================================================
" CTAGS
"=========================================================================

"=========================================================================
" Backup"
"=========================================================================

" Backups & Files
" Enable creation of backup file
set backup
" Where backups will go.
set backupdir=~/.vim/backups
"Where temporary files will go.
set directory=~/.vim/tmp
"=========================================================================
" General
"=========================================================================
"

" 80 char limit bar
set cc=80

set wildignore+=node_modules,target

set completeopt+=longest
set completeopt-=preview
" SuperTab stuff
" let g:SuperTabDefaultCompletionType = "<c-x><c-p>"
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabLongestEnhanced = 1
" Make Omnicomplete close the suggestion window on cursor move
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Git commit messages are tarded
autocmd BufRead,BufNewFile *MERGE_MSG set filetype=gitcommit

"Sets how many lines of history VIM has to remember
set history=256
" Set auto read when a file is changed from the outside
set autoread

" Writes on make/shell commands
set autowrite

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Ability to clear all buffers
function! DAR()
    let aval = char2nr('a')
    let zval = char2nr('z')
    let i = aval
    while i <= zval
        exe "let @".nr2char(i)." = \"\""
        let i = i + 1
    endw
endfu

"=========================================================================
" Word Processor
"=========================================================================

autocmd BufRead */.txt setlocal formatoptions=1
autocmd BufRead */.txt setlocal fo=atn
autocmd BufRead */.txt setlocal tw=80
autocmd BufRead */.txt setlocal lbr
autocmd BufRead */.txt map j gj
autocmd BufRead */.txt map k gk
autocmd BufRead */.txt setlocal smartindent
autocmd BufRead */.txt setlocal spelllang=en_us
autocmd BufRead */.txt setlocal spell
