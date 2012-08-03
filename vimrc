" All UTF-8 all the time
scriptencoding utf-8
set encoding=utf-8

" Initialize Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'taglist.vim'
Bundle 'PickAColor.vim'
Bundle 'BufOnly.vim'
"Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
"Bundle 'CSApprox.vim'
"Bundle 'statusline.vim'
Bundle 'wavded/vim-stylus'
Bundle 'Lokaltog/vim-powerline'

" Enable filetype-specific indenting, syntax, and plugins
filetype plugin indent on
syntax on

" Vim 7.3 and newer can persist undo history across sessions
if v:version >= 703
    set undofile
    set undodir=~/.vim/tmp
endif

set directory=~/.vim/tmp "where to put swap files
set backupdir=~/.vim/backup "where to put backups
set viewdir=~/.vim/view
set autoread "re-read files when they're changed externally
set nobackup
set nowritebackup
set noswapfile

"set clipboard+=unnamed "yanks and pastes use the clipboard instead
set foldlevelstart=99 "no folds, please
set timeoutlen=250 "time to wait for a command (after leader, for example)
set hidden "change buffer without saving
set showmatch "show matching brackets
set matchtime=2 "how many tenths of a second to blink

" Modelines
set modeline
set modelines=5

" Tabs and spacing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab "expandtab for spaces, noexpandtab for tabs
set smarttab
set autoindent
set smartindent
set shiftround

" Language-specific settings
autocmd FileType,BufEnter,BufWinEnter python,javascript,coffee,css,less,scss set expandtab tabstop=4 shiftwidth=4 softtabstop=4 "textwidth=79 "PEP0008 compliance
autocmd FileType,BufEnter,BufWinEnter ruby,html,htmldjango,eruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType,BufEnter,BufWinEnter django set ft=django.html
autocmd FileType,BufEnter,BufWinEnter eruby set ft=eruby.html
autocmd FileType,BufEnter,BufWinEnter css,less set ft=less.css
autocmd FileType,BufEnter,BufWinEnter scss set ft=scss.css
autocmd FileType,BufEnter,BufWinEnter jade set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd BufRead,BufNewFile *.json set ft=javascript

set ruler
set nowrap
set number
set laststatus=2
set report=0
"set showcmd
set listchars=tab:\▸\ ,trail:·,eol:¶

" Show current line in current window only
set cursorline
autocmd WinEnter,BufEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Automatically strip trailing whitespace.
autocmd BufWritePre * :%s/\s\+$//e

" Searching
set nohlsearch "don't highlight search results by default
set ignorecase
set smartcase
set incsearch "search-as-you-type
set gdefault "assume the /g flag on :s substitutions to replace all matches in a line
set wrapscan "searches wrap around the end of the file

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=.DS_Store,*.pyc,*.scssc,COMMIT_EDITMSG
set wildignore+=*/.git/*,*/node_modules/*
set wildignore+=*/tmp/*
set wildignore+=sass-cache/*,.sass-cache/*,*.scssc
set wildignore+=*/media/*,*/html/*,*/source/media/*,*.pyc
set infercase "ignore case on insert completion

" MacVIM shift+arrows to select behavior. Required in .vimrc instead of
" .gvimrc for some reason.
let macvim_hig_shift_movement=1

" Window management
set splitbelow "open new horizontal splits below the current
set splitright "open new veritcal splits to the right of the current

" Statusline
"set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P "default statusline
set statusline=%<%f%(\ %h%m%r%w%q%)
set statusline+=%(\ (%{&ff})%)
set statusline+=%=
set statusline+=%-19.{fugitive#statusline()}\ %-14.(%l,%c%V%)\ %P

" Enable the mouse in terminal Vim (if supported). In OS X iTerm provides
" this functionality.
set mouse=a


" GENERAL KEYBINDINGS

let mapleader=','

" Escape key alternatives
imap <S-CR> <Esc>
imap kj <Esc>

map <Leader>r :registers<CR>

" Toggles
map <Leader>i :set invlist<CR>:exe ":echo 'toggling invisibles'"<CR>
map <Leader>. :set number! nonumber?<CR>
map <Leader>s :set hlsearch! hlsearch?<CR>
map <Leader>w :set wrap! wrap?<CR>

" Tabs
nmap TN :wa<CR>:tabnext<CR>
nmap TP :wa<CR>:tabnext<CR>

" Buffers
nmap BN :wa<CR>:bnext<CR>
nmap BP :wa<CR>:bprev<CR>
nmap BO :wa<CR>:BufOnly<CR>

" Session management
nmap SSA :wa<CR>:mksession! ~/.vim/session/
nmap SO :wa<CR>:so ~/.vim/session/

" Splits
map SP :wa<CR>:sp<CR>
map VS :wa<CR>:vs<CR>

" Tri-Split
nmap SSS :wa<CR>:vs<CR><C-w><C-l>:sp<CR><C-w><C-h>:exe ":echo 'Pew pew pew!'"<CR>

" File Handling
nmap E :wa<CR>:e

" Shortcut to open stuff in the Vim directory (mostly just to ease .vimrc
" hacking)
nmap <Leader>v :wa<CR>:e ~/.vim/

" Spaces and tabs settings
nmap <Leader>1 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>:exe ":echo 'Spaces, 4'"<CR>
nmap <Leader>2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>:exe ":echo 'Spaces, 2'"<CR>
nmap <Leader>3 :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>:exe ":echo 'Tabs, 4'"<CR>
nmap <Leader>4 :set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>:exe ":echo 'Tabs, 2'"<CR>

" Visual mode blockwise indent
" This keeps the current visual block selection active after changing indent
" with '<' or '>'. Usually the visual block selection is lost after you shift
" it, which is incredibly annoying.
" http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
vmap > >gv
vmap < <gv


" PLUGIN CONFIGURATION

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
let NERDChristmasTree=1 "colorize
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1 "show hidden files
let NERDTreeHijackNetrw=1 "sure, hijack netrw
let NERDTreeIgnore=['\.$', '\~$', '\.git']

" NERDCommenter
let NERDSpaceDelims=0 "number of spaces to add before comments

" Exuberant CTags
map <Leader>l :TlistToggle<CR>
map <Leader>m :TagbarToggle<CR>

" Command-T
map <Leader>t :CommandT<CR>
let g:CommandTMatchWindowAtTop=0
let g:CommandTMaxHeight=20

" Ctrlp
let g:ctrlp_max_height = 20
let g:ctrlp_jump_to_buffer = 2 "if the file's already open somewhere (anywhere) jump to it
let g:ctrlp_working_path_mode = 2 "try and find the repo root and search from there

" SuperTab
let g:SuperTabDefaultCompletionType='context' "let SuperTab determine which completion mode should be used

" SnipMate
let g:snips_author='Roshambo'

" Auto-compile CoffeeScript on save
"autocmd BufWritePost *.coffee silent CoffeeMake! | cwindow | redraw!

" Syntastic
map <Leader>e :Errors<CR>
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=0
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=2

" Statusline.vim
"let g:statusline_fugitive=1
"let g:statusline_fullpath=0

" Syntastic/PyFlakes
" We have to run a mini Python script here to append 'site-packages' to the Python
" path at runtime.
if has('python')
python << EOF
import os, sys, vim
sys.path.append('/usr/local/lib/python2.7/site-packages')
EOF
endif

" CoffeeTags
" The CoffeeTags gem is required for this. The code below was generated via:
" $ coffeetags --vim-conf --includevars >> ~/.vimrc
let g:tagbar_type_coffee = {
\ 'kinds' : [
\   'f:functions',
\   'o:object'
\ ],
\ 'kind2scope' : {
\  'f' : 'object',
\   'o' : 'object'
\},
\ 'sro' : ".",
\ 'ctagsbin' : 'coffeetags',
\ 'ctagsargs' : ' ',
\}
