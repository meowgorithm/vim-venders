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
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
"Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'taglist.vim'
"Bundle 'PickAColor.vim'
Bundle 'BufOnly.vim'
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'godlygeek/csapprox'
"Bundle 'statusline.vim'
Bundle 'wavded/vim-stylus'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'AutoTag'
Bundle 'JSON.vim'
Bundle 'guns/xterm-color-table.vim'
Bundle 'fatih/vim-go'
Bundle 'aliva/vim-fish'
Bundle 'Jinja'
Bundle 'milkypostman/vim-togglelist'
Bundle 'jsx/jsx.vim'
Bundle 'kballard/vim-swift'

" Enable filetype-specific indenting, syntax, and plugins
filetype plugin indent on
syntax on

set t_Co=256
colorscheme roshambo

" Vim 7.3 and newer can persist undo history across sessions
if v:version >= 703
  set undofile
  set undodir=~/.vim/tmp
endif

" Keep Vim from freaking out under Fish Shell
set shell=bash

set directory=~/.vim/tmp "where to put swap files
set backupdir=~/.vim/backup "where to put backups
set viewdir=~/.vim/view
set autoread "re-read files when they're changed externally
set nobackup
set nowritebackup
set noswapfile

"set clipboard+=unnamed "yanks and pastes use the clipboard instead
"set foldlevelstart=99 "no folds, please
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

set colorcolumn=80

" Language-specific settings
autocmd FileType,BufEnter,BufWinEnter python set expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 "PEP0008 compliance
autocmd FileType,BufEnter,BufWinEnter ruby,html,htmldjango,eruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType,BufEnter,BufWinEnter django set ft=django.html
autocmd FileType,BufEnter,BufWinEnter eruby set ft=eruby.html
autocmd FileType,BufEnter,BufWinEnter less set ft=less.css
autocmd FileType,BufEnter,BufWinEnter scss set ft=scss.css
autocmd FileType,BufEnter,BufWinEnter jade,stylus set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType,BufRead,BufNewFile *.json set ft=json
autocmd FileType,BufRead,BufNewFile *.go set filetype=go
autocmd FileType,BufRead,BufNewFile *.rive set filetype=rivescript

set ruler
set nowrap
set number
set laststatus=2
set report=0
set listchars=tab:\▸\ ,trail:·,eol:¶

" Show current line in current window only
set cursorline
autocmd WinEnter,BufEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Automatically strip trailing whitespace
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
set wildignore+=*/vendor/*
set wildignore+=sass-cache/*,.sass-cache/*,*.scssc
set infercase "ignore case on insert completion

" Window management
set splitbelow "open new horizontal splits below the current
set splitright "open new veritcal splits to the right of the current

" Enable the mouse in terminal Vim (if supported)
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Text formatting options, mostly around comments. See fo-table.
set formatoptions+=rocr


" KEYBINDINGS

" The comma is way easier to reach than the backslash, the default <leader>
let mapleader=','

" Escape key alternatives
imap kj <Esc>

" Show registers
map <Leader>r :registers<CR>

" Toggles
map <Leader>i :set invlist<CR>:exe ":echo 'toggling invisibles'"<CR>
map <Leader>. :set number! nonumber?<CR>
map <Leader>s :set hlsearch! hlsearch?<CR>
map <Leader>w :set wrap! wrap?<CR>
map <Leader>p :set paste! nopaste?<CR>

" Tabs
nmap TT :wa<CR>:tabnew<CR>

" Buffers
nmap BN :wa<CR>:bnext<CR>
nmap BP :wa<CR>:bprev<CR>
nmap BO :wa<CR>:BufOnly<CR>
nmap BD :wa<CR>:bdelete<CR>

" Remove empty buffers
function! g:CleanEmptyBuffers()
  let buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0')
  if !empty(buffers)
  exe 'bw '.join(buffers, ' ')
  endif
endfunction

nmap BC :call g:CleanEmptyBuffers()<CR>

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

" Visual Mode Blockwise Indent
" This keeps the current visual block selection active after changing indent
" with '<' or '>'. Usually the visual block selection is lost after you shift
" it, which is incredibly annoying.
" http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
vmap > >gv
vmap < <gv

" PLUGIN CONFIGURATION

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>
let NERDChristmasTree=1
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1
let NERDTreeIgnore=['\.$', '\~$', '\.git', '\.DS_Store', '.*\.pyc']

" NERDCommenter
let NERDSpaceDelims=0 "number of spaces to add before comments
map <c-c> <plug>NERDCommenterToggle<cr>
imap <c-c> <esc><plug>NERDCommenterToggle<cr>a

" Exuberant CTags
map <Leader>l :TlistToggle<CR>
map <Leader>m :TagbarToggle<CR>

" Command-T
map <Leader>t :CommandT<CR>
let g:CommandTMatchWindowAtTop=0
let g:CommandTMaxHeight=20

" Ctrlp
map CC :CtrlPClearCache<CR>
let g:ctrlp_max_height = 20
let g:ctrlp_jump_to_buffer = 2 "if the file's already open somewhere (anywhere) jump to it
let g:ctrlp_working_path_mode = 2 "try and find the repo root and search from there

" SuperTab
"autocmd FileType go let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

" SnipMate
let g:snips_author='Christian Rocha'

" Configure ack.vim to use The Silver Searcher instead of Ack
" See: https://github.com/ggreer/the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" AutoTag (find tagfile and auto-generate tags on save)
" Requires Vim with Python
let autoTagsFile = '~/.vim/bundle/AutoTag/plugin/autotag.vim'
if filereadable(autoTagsFile)
  source autoTagsFile
endif

" Syntastic
"map <Leader>e :Errors<CR>
nmap <script> <silent> <leader>e :call ToggleLocationList()<cr>
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=2
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_warning_symbol='W>'
let g:syntastic_enable_balloons = 1
let g:syntastic_python_flake8_args='--ignore=E501,E128,E226,E261,E265,E401' " ignore line length warnings

" JSX support. For this to work you'll need to do the following:
"    npm install -g eslint
"    npm install -g babel-eslint
"    npm install -g eslint-plugin-react
" For more info see the notes at: https://github.com/jaxbot/syntastic-react
let g:syntastic_javascript_checkers = ['eslint']

" Syntastic/Flake8
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
\ 'f:functions',
\ 'o:object'
\ ],
\ 'kind2scope' : {
\ 'f' : 'object',
\ 'o' : 'object'
\},
\ 'sro' : ".",
\ 'ctagsbin' : 'coffeetags',
\ 'ctagsargs' : ' ',
\}

" Go
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_array_whitespace_error = 1

" vim:et:ts=2:sw=2:fdm=marker
