" vim:et:ts=2:sw=2:fdm=marker

" Bootstrap vim-plug
if has("nvim")

  let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
  if !filereadable(autoload_plug_path)
    silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs
        \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  unlet autoload_plug_path

else

  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif

endif

" All UTF-8 all the time
scriptencoding utf-8
set encoding=utf-8

" https://github.com/vim/vim/issues/3117
if has('python3')
  silent! python3 1
endif

" Turning this on diables Airline and instead shows the syntax definition
" in the status line
let debug_color_scheme = 0

"
" PLUGINS
"

call plug#begin()

" General behavioral stuff stuff
if !debug_color_scheme
  Plug 'vim-airline/vim-airline'
endif
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'machakann/vim-highlightedyank'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-scripts/taglist.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'
Plug 'w0rp/ale'
Plug 'zxqfl/tabnine-vim'

" Languages
Plug 'fatih/vim-go'
Plug 'elmcast/elm-vim'
Plug 'kchmck/vim-coffee-script'
Plug 'digitaltoad/vim-pug'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'neovimhaskell/haskell-vim'

" Utils
"Plug 'guns/xterm-color-table.vim'

call plug#end()

if debug_color_scheme
  " show the syntax definition in the status line
  function! syntaxitem()
    return synidattr(synid(line("."),col("."),1),"name")
  endfunction
  set statusline=%{syntaxitem()}
endif

" Enable filetype-specific indenting, syntax, and plugins
filetype plugin indent on
syntax on

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif
colorscheme meowgorithm

if has("persistent_undo")
  set undofile
  if !has('nvim')
    set undodir=~/.vim/tmp
  endif
endif

if !has('nvim')
  set directory=~/.vim/tmp    " where to put swap files
  set backupdir=~/.vim/backup " where to put backups
  set viewdir=~/.vim/view
  set dir=~/.vim/swap
  set nobackup
  set nowritebackup
  set noswapfile
endif
set shell=bash                " keep Vim from freaking out under weird shells (like Fish)
set autoread                  " re-read files when they're changed externally
set tabstop=4
set shiftwidth=4
set softtabstop=4
set history=1000
set tabpagemax=50
set expandtab
set autoindent
set smarttab
set smartindent
set shiftround
set timeoutlen=250            " time to wait for a command (after leader, for example)
set hidden                    " change buffer without saving
set showmatch                 " show matching brackets
set matchtime=2               " how many tenths of a second to blink
set modeline
set modelines=5
set ruler
set nowrap
set number
set laststatus=2
set report=0
set listchars=tab:\▸\ ,trail:·,eol:¶
set colorcolumn=80
set sessionoptions-=options
set scrolloff=1
set sidescrolloff=5

" Text formatting options, mostly around comments. See :help fo-table.
set formatoptions+=rocrj1

" Searching
set nohlsearch " don't highlight search results by default
set ignorecase
set smartcase
set gdefault   " assume the /g flag on :s substitutions to replace all matches in a line
set wrapscan   " searches wrap around the end of the file

" Highlight current line in current window only
set cursorline
autocmd WinEnter,BufEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Language-specific settings
autocmd FileType vim set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python set expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 " per PEP0008

" Automatically strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Completion settings
set wildmode=list:longest,list:full

" Ignores + ignores + settings for wild mode
" This also affects services like Ctrl+P
set infercase " ignore case on insert completion
set wildignore+=.DS_Store,*.pyc,*.scssc,COMMIT_EDITMSG
set wildignore+=*/.git/*,*/node_modules/*,*/elm-stuff/*,*/tmp/*,*/.cache/*
set wildignore+=*/build/*,*/dist/*,*/vendor/*,*/pkg/*
set wildignore+=*/plugged/*

" Window management
set splitbelow " open new horizontal splits below the current
set splitright " open new veritcal splits to the right of the current

" Enable the mouse in terminal Vim (if supported)
set mouse+=a
if !has('nvim') && &term =~ '^screen'
  " Extended mouse mode
  " See :help ttymouse
  set ttymouse=sgr
endif

let mapleader=','
nmap TT :wa<cr>:tabnew<cr>
nmap BN :wa<cr>:bnext<cr>
nmap BP :wa<cr>:bprev<cr>
nmap BO :wa<cr>:BufOnly<cr>
nmap BD :wa<cr>:bdelete<cr>
map SP :wa<cr>:sp<cr>
map VS :wa<cr>:vs<cr>
map <leader>r :registers<cr>
nmap SO :source $MYVIMRC<cr>:exe ":echo 'configuration reloaded'"<cr>
nnoremap LC :e $MYVIMRC<cr>

" Faster window navigation
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

" Toggles
map <leader>i :set invlist<cr>:exe ":echo 'toggling invisibles'"<cr>
map <leader>. :set number! nonumber?<cr>
map <leader>s :set hlsearch! hlsearch?<cr>
map <leader>w :set wrap! wrap?<cr>
map <leader>p :set paste! nopaste?<cr>

" Toggle the error list
nmap <script> <silent> E :call ToggleLocationList()<cr>

" Remove empty buffers
function! g:CleanEmptyBuffers()
  let buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0')
  if !empty(buffers)
  exe 'bw '.join(buffers, ' ')
  endif
endfunction
nmap BC :call g:CleanEmptyBuffers()<cr>

" Session management
nmap SSA :wa<cr>:mksession! ~/.vim/session/
nmap SL  :wa<cr>:so         ~/.vim/session/

" Switch between spaces and tabs
nmap <leader>1 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<cr>:exe ":echo 'spaces, 2'"<cr>
nmap <leader>2 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<cr>:exe ":echo 'spaces, 4'"<cr>
nmap <leader>3 :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<cr>:exe ":echo 'tabs, 4'"<cr>
nmap <leader>4 :set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2<cr>:exe ":echo 'tabs, 2'"<cr>

" Visual Mode Blockwise Indent
" This keeps the current visual block selection active after changing indent
" with '<' or '>'. Usually the visual block selection is lost after you shift
" it, which is incredibly annoying.
" http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
vmap > >gv
vmap < <gv

"
" Ale
"
let g:ale_linters = {}
let g:ale_fixers  = {}
let g:ale_fix_on_save = 1
let g:ale_go_langserver_executable = 'gopls'
let g:ale_linters['go'] = ['gopls']
let g:ale_fixers['elm'] = 'format'
let g:ale_linters['javascript'] = ['eslint']
let g:ale_fixers['javascript'] = ['eslint', 'prettier']
let g:ale_javascript_prettier_options = '--trailing-comma all --tab-width 4'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fixers['scss'] = 'prettier'
let g:ale_scss_prettier_options = '--trailing-comma all --tab-width 4'
let g:ale_scss_prettier_use_local_config = 1
let g:ale_fixers['json'] = 'prettier'
let g:ale_fixers['python']  = ['yapf']
let g:ale_linters['python'] = ['flake8', 'mypy']
let g:ale_linters['haskell'] = ['hie']
let g:ale_fixers['haskell']  = ['brittany']

"
" UltiSnips
"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsEditSplit = 'vertical'
if has('nvim')
  let g:UltiSnipsSnippetsDir = stdpath('config') . '/snippets'
else
  let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
endif

" UltiSnips completion function that makes it work nicely with the wildmenu
" (so omnifunc, YouCompleteMe, TabNine, CoC and so on)
" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-171966710
"
" Another working (though not as good as the above) solution was:
" https://github.com/Valloric/YouCompleteMe/issues/36#issuecomment-15451411

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

"
" Airline
"
let g:airline#extensions#ale#enabled = 1

"
" GitGutter
"
let g:gitgutter_sign_modified         = '•'
let g:gitgutter_sign_modified_removed = '•-'

"
" NERDTree
"
map <leader>n :NERDTreeToggle<cr>
map <leader>f :NERDTreeFind<cr>
let NERDChristmasTree           = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowBookmarks       = 1
let NERDTreeShowHidden          = 1
let NERDTreeHijackNetrw         = 1
let NERDTreeIgnore              = [
  \ '\.$', '\~$', '\.git', '\.DS_Store', '.*\.pyc',
  \ 'node_modules', 'elm-stuff', '.cache'
  \ ]

"
" NERDCommenter
"
let NERDSpaceDelims = 0 " number of spaces to add before comments
map <c-c> :NERDCommenterToggle<cr>
imap <c-c> <esc>:NERDCommenterToggle<cr>a

"
" CtrlP
"
if executable('rg')
  " Use RipGrep for CtrlP searches, if it's installed. Also just use it for
  " general grepping.
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
nmap ; :CtrlPBuffer<cr>
nnoremap <c-l> :CtrlPMRUFiles<cr>

let g:ctrlp_max_height  = 25
let g:ctrlp_jump_to_buffer = 0 " enable this to jump to open windows if the file is open there. see ctrlp help.
let g:ctrlp_working_path_mode = 'ra' " try and find the repo root and search from there

"
" Tagbar
"
map <leader>m :TagbarToggle<cr>

"
" EasyAlign
"

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"
" Elm
"
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 1
let g:elm_browser_command = ""
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 1
let g:elm_setup_keybindings = 1

"
" Golang
"
let g:go_bin_path = expand("$HOME/.go/bin")
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_auto_sameids = 0 " highlight other variables that match the one under the cursor
let g:go_auto_type_info = 1
let g:go_fmt_command = 'goimports'

" Curious background-color-erase fix/hack, apparently
" https://github.com/kovidgoyal/kitty#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
" (We set this specifically for Kitty)
let &t_ut=''
