vim9script

# Bootstrap vim-plug {{{
var autoloadPlugPath = $HOME .. '/.vim/autoload/plug.vim'

if !filereadable(autoloadPlugPath)
  silent execute '!curl -fLo ' .. autoloadPlugPath .. ' --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
# }}}

# All UTF-8 all the time.
scriptencoding utf-8
set encoding=utf-8

# Supress error message the first time Python 3 is loaded.
# https://github.com/vim/vim/issues/3117
if has('python3')
  silent! python3 1
endif

#
# Plugins
#

plug#begin()

# Ergonomics
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'
#Plug 'Raimondi/delimitMate' # auto-closes brackets, parens, quotes, etc.

# UI
Plug 'vim-airline/vim-airline'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-hijack.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/taglist.vim'
Plug 'ctrlpvim/ctrlp.vim'

# Utils
Plug 'jamessan/vim-gnupg'
if has('python3')
  Plug 'SirVer/ultisnips'
endif

# LSP and Languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat', { 'for': 'nix' } # just for alejandra
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'cakebaker/scss-syntax.vim'
Plug 'sheerun/vim-polyglot'
Plug 'yegappan/lsp' # vim9script lsp

g:polyglot_disabled = ['elm', 'go', 'haskell', 'javascript']

plug#end()

#
# General
#

#if debug_color_scheme
#  # Show the syntax definition in the status line
#  def SyntaxItem()
#    return synIDattr(synID(line("."),col("."),1),"name")
#  enddef
#  set statusline=%{SyntaxItem()}
#endif

# Vim-Plug calls this but we're leaving it here anyway.
filetype plugin indent on
syntax on

# Allow color schemes to do bright colors without forcing bold.
if &t_Co == "8" && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

colorscheme meowgorithm

if has('persistent_undo')
  var undoTmp = $HOME .. '/.vim/undo'
  set undofile
  call mkdir(undoTmp, 'p')
  &undodir = undoTmp
endif

&directory = $HOME .. '/.vim/swap'
&backupdir = $HOME .. '/.vim/backup'
&viewdir = $HOME .. '/.vim/view'

set nobackup
set nowritebackup
set noswapfile
set shell=bash     # keep Vim from freaking out under weird shells (like Fish)
set autoread       # re-read files when they're changed externally
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
set timeoutlen=250 # time to wait for a command (after leader, for example)
set hidden         # change buffer without saving
set showmatch      # show matching brackets
set matchtime=2    # how many tenths of a second to blink
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
set scrolloff=5
set sidescrolloff=5

# Always show the signcolumn to reduce jumpiness
if has("patch-8.1.1564")
  # Note that Vim can merge signcolumn and number column into one in recent
  # versions with:
  #
  # set signcolumn=number
  set signcolumn=yes
else
  set signcolumn=yes
endif

# Text formatting options, mostly around comments. See :help fo-table.
set formatoptions+=rocrj1

# Searching.
set nohlsearch # don't highlight search results by default
set ignorecase
set smartcase
set gdefault   # assume the /g flag on :s substitutions to replace all matches in a line
set wrapscan   # searches wrap around the end of the file
set incsearch  # search as you type

# Highlight current line in current window only.
set cursorline
autocmd WinEnter,BufEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

# Language-specific settings.
autocmd FileType vim set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python set expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 # per PEP0008
autocmd FileType lua set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType cabal set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType yaml set tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType typescript set syntax=javascript

# Markdown spell checking
augroup markdownSpell
  autocmd!
  autocmd FileType markdown setlocal spell
  autocmd BufRead,BufNewFile *.md setlocal spell
augroup END

# Automatically strip trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

# Completion settings.
set wildmode=list:longest,list:full

# Ignores + ignores + settings for wild mode
# This also affects services like Ctrl+P
set infercase # ignore case on insert completion
set wildignore+=.DS_Store,*.pyc,*.scssc,COMMIT_EDITMSG
set wildignore+=*/.git/*,*/node_modules/*,*/elm-stuff/*,*/tmp/*,*/.cache/*
set wildignore+=*/build/*,*/dist/*,*/dist-newstyle/*,*/vendor/*,*/pkg/*
set wildignore+=*/plugged/*

# Window management.
set splitbelow # open new horizontal splits below the current
set splitright # open new veritcal splits to the right of the current

# Enable the mouse in terminal Vim, if supported.
set mouse+=a

# Enable balloons (Vim only).
if &term =~ '^screen'
  # Extended mouse mode
  # See :help ttymouse
  set ttymouse=sgr
  set balloonexpr=1
endif

g:mapleader = ','
nmap TT :wa<cr>:tabnew<cr>
nmap BN :wa<cr>:bnext<cr>
nmap BP :wa<cr>:bprev<cr>
nmap BO :wa<cr>:BufOnly<cr>
nmap BD :wa<cr>:bdelete<cr>
map  SP :wa<cr>:sp<cr>
map  VS :wa<cr>:vs<cr>
map  <leader>r :registers<cr>
nmap <silent>SO :source $MYVIMRC<cr>:exe ":echo 'configuration reloaded'"<cr>
nnoremap LC :e $MYVIMRC<cr>

# Faster window navigation?
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

# Toggles.
map <leader>i :set invlist<cr>:exe ":echo 'toggling invisibles'"<cr>
map <leader>s :set hlsearch! hlsearch?<cr>
map <leader>w :set wrap! wrap?<cr>
map <leader>p :set paste! nopaste?<cr>

# Toggle the error list
#nmap <script> <silent> E :call ToggleLocationList()<cr>

# Close quickfix, location list, and preview windows.
def CloseHelperWindows()
  # get current window number
  var n = winnr()
  var isParent = 1
  if &buftype == "quickfix" || &buftype == "locationList"
      var isParent = 0
  endif

  # cycle through windows and close their helper windows. this will set the
  # focus to the last window when complete.
  windo if &buftype == "quickfix" || &buftype == "locationlist" | lclose | endif
  pclose

  # return to the original window
  if isParent == 1
    execute n . "wincmd w"
  endif
enddef

nmap X :call CloseHelperWindows()<cr>

# Remove empty buffers.
def g:CleanEmptyBuffers()
  var buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0')
  if !empty(buffers)
    exe 'bw '.join(buffers, ' ')
  endif
enddef
nmap BC :call g:CleanEmptyBuffers()<cr>

# Session management.
nmap SSA :wa<cr>:mksession! ~/.vim/session/
nmap SL  :wa<cr>:so         ~/.vim/session/

# Switch between spaces and tabs.
nmap <leader>1 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<cr>:exe ":echo 'spaces, 2'"<cr>
nmap <leader>2 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<cr>:exe ":echo 'spaces, 4'"<cr>
nmap <leader>3 :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<cr>:exe ":echo 'tabs, 4'"<cr>
nmap <leader>4 :set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2<cr>:exe ":echo 'tabs, 2'"<cr>

# Visual Mode Blockwise Indent. This keeps the current visual block selection
# active after changing indent with '<' or '>'. Usually the visual block
# selection is lost after you shift it, which is incredibly annoying.
#
# http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
vmap > >gv
vmap < <gv

# How about if just one < or > indents in normal mode?
nmap > >>
nmap < <<

#
# CoC
#

# Don't pass messages to |ins-completion-menu|.
set shortmess+=c

# Show Diagnostics
nmap E :CocDiagnostics<cr>

# Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

#
# NeoFormat
#
autocmd BufWritePre *.nix try | undojoin | Neoformat | catch /E790/ | Neoformat | endtry

#
# UltiSnips
#
g:UltiSnipsExpandTrigger = '<tab>'
g:UltiSnipsJumpForwardTrigger = '<tab>'
g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
g:UltiSnipsEditSplit = 'vertical'
g:UltiSnipsEditSplit = 'vertical'
g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'

#
# Airline
#
g:airline#extensions#ale#enabled = 1

#
# GitGutter
#
g:gitgutter_sign_modified         = '•'
g:gitgutter_sign_modified_removed = '•-'
g:gitgutter_set_sign_backgrounds  = 1 # match to SignColumn

#
# Fern (Tree)
#
nnoremap <leader>n :Fern . -drawer -toggle<cr>
g:fern#renderer#default#leaf_symbol = "│ "
g:fern#renderer#default#collapsed_symbol = "+ "
g:fern#renderer#default#expanded_symbol = "- "

#
# NERDCommenter
#
var NERDSpaceDelims = 0 # number of spaces to add before comments
map <c-c> :NERDCommenterToggle<cr>
imap <c-c> <esc>:NERDCommenterToggle<cr>a

#
# CtrlP
#
if executable('rg')
  # Use RipGrep for CtrlP searches, if it's installed. Also just use it for
  # general grepping.
  set grepprg=rg\ --color=never
  g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  g:ctrlp_use_caching = 0
endif
nmap ; :CtrlPBuffer<cr>
nnoremap <c-o> :CtrlPMRUFiles<cr>

g:ctrlp_max_height = 25
g:ctrlp_jump_to_buffer = 0 # enable this to jump to open windows if the file is open there. see ctrlp help.
g:ctrlp_working_path_mode = 'ra' # try and find the repo root and search from there

#
# Tagbar
#
map <leader>m :TagbarToggle<cr>

#
# EasyAlign
#

# Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

# Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

#
# Elm
#
g:elm_jump_to_error = 0
g:elm_make_output_file = "elm.js"
g:elm_make_show_warnings = 1
g:elm_browser_command = ""
g:elm_detailed_complete = 1
g:elm_format_autosave = 1
g:elm_format_fail_silently = 1
g:elm_setup_keybindings = 1

#
# Golang
#
g:go_bin_path = expand("$HOME/.go/bin")
g:go_highlight_functions = 1
g:go_highlight_operators = 1
g:go_highlight_methods = 1
g:go_highlight_structs = 1
g:go_highlight_trailing_whitespace_error = 1
g:go_highlight_space_tab_error = 1
g:go_highlight_types = 1
g:go_highlight_extra_types = 1
g:go_highlight_chan_whitespace_error = 1
g:go_highlight_array_whitespace_error = 1
g:go_highlight_build_constraints = 1
g:go_highlight_fields = 1
g:go_auto_sameids = 0 # highlight other variables that match the one under the cursor
g:go_auto_type_info = 1
g:go_fmt_command = 'goimports'
g:go_metalinter_command = 'golangci-lint'
g:go_metalinter_enabled = []

#
# Prettier
#
command! -nargs=0 Prettier :CocCommand prettier.formatFile

#
# JavaScript
#
g:javascript_plugin_flow = 1

# Helptags
#
# Load all plugins now. Plugins need to be added to runtimepath before
# helptags can be generated.
packloadall
# Load all of the helptags now, after plugins have been loaded. All messages
# and errors will be ignored.
silent! helptags ALL

# Curious background-color-erase fix/hack, apparently. We set this
# specifically for Kitty.
#
# https://github.com/kovidgoyal/kitty#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
&t_ut = ''

# vim:et:ts=2:sw=2:fdm=marker
