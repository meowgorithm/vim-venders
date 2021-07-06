" vim:et:ts=2:sw=2:fdm=marker

" Bootstrap vim-plug {{{
if has('nvim')
  let autoloadPlugPath = stdpath('data') . '/site/autoload/plug.vim'
else
  let autoloadPlugPath = $HOME . '/.vim/autoload/plug.vim'
endif

if !filereadable(autoloadPlugPath)
  silent execute '!curl -fLo ' . autoloadPlugPath . ' --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

unlet autoloadPlugPath
" }}}

" All UTF-8 all the time.
scriptencoding utf-8
set encoding=utf-8

" Supress error message the first time Python 3 is loaded.
" https://github.com/vim/vim/issues/3117
if has('python3')
  silent! python3 1
endif

" Turning this on disbles Airline and instead shows the syntax definition in
" the status line.
let debug_color_scheme = 0

"
" Plugins
"

call plug#begin()

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
if has('python3')
  Plug 'SirVer/ultisnips'
end
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'Raimondi/delimitMate' " auto-closes brackets, parens, quotes, etc.
Plug 'majutsushi/tagbar'
Plug 'milkypostman/vim-togglelist'
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
  Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
  Plug 'kabouzeid/nvim-lspinstall'
else
  "Plug 'w0rp/ale'
  "Plug 'codota/tabnine-vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
end
Plug 'chrisbra/Colorizer'
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'sheerun/vim-polyglot'
Plug 'cakebaker/scss-syntax.vim'
if !has('nvim')
  Plug 'wincent/terminus' " nice cursors, better paste, better mouse, and so on
end

let g:polyglot_disabled = ['elm', 'go', 'haskell', 'javascript']

call plug#end()

"
" General
"

if debug_color_scheme
  " Show the syntax definition in the status line
  function! SyntaxItem()
    return synIDattr(synID(line("."),col("."),1),"name")
  endfunction
  set statusline=%{SyntaxItem()}
endif

" Vim-Plug calls this but we're leaving here anyway.
filetype plugin indent on
syntax on

" Allow color schemes to do bright colors without forcing bold.
if !has('nvim') && &t_Co == 8 && $TERM !~# '^linux\|^Eterm'
  set t_Co=16
endif

" NeoVim can use TrueColor in color schemes.
"if has('termguicolors')
"    set termguicolors
"endif

colorscheme Meowgorithm

if has('persistent_undo')
  if has('nvim')
    let undoTmp = stdpath('data') . '/undo'
  else
    let undoTmp = $HOME . '/.vim/undo'
  end

  set undofile
  call mkdir(undoTmp, 'p')
  let &undodir = undoTmp
  unlet undoTmp
endif

if has('nvim')
  let &directory = stdpath('data') . '/swap'   " where to put swap files
  let &backupdir = stdpath('data') . '/backup' " where to put backups
  let &viewdir = stdpath('data') . '/view'     " where to put views
else
  let &directory = $HOME . '/.vim/swap'
  let &backupdir = $HOME . '/.vim/backup'
  let &viewdir = $HOME . '/.vim/view'
endif

set nobackup
set nowritebackup
set noswapfile
set shell=bash     " keep Vim from freaking out under weird shells (like Fish)
set autoread       " re-read files when they're changed externally
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
set timeoutlen=250 " time to wait for a command (after leader, for example)
set hidden         " change buffer without saving
set showmatch      " show matching brackets
set matchtime=2    " how many tenths of a second to blink
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

" Always show the signcolumn to reduce jumpiness
if has("patch-8.1.1564")
  " Note that Vim can merge signcolumn and number column into one in recent
  " versions with:
  "
  " set signcolumn=number
  set signcolumn=yes
else
  set signcolumn=yes
endif

" Text formatting options, mostly around comments. See :help fo-table.
set formatoptions+=rocrj1

" Searching.
set nohlsearch " don't highlight search results by default
set ignorecase
set smartcase
set gdefault   " assume the /g flag on :s substitutions to replace all matches in a line
set wrapscan   " searches wrap around the end of the file
set incsearch  " search as you type

" Highlight current line in current window only.
set cursorline
autocmd WinEnter,BufEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Language-specific settings.
autocmd FileType vim set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType python set expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 " per PEP0008

" Automatically strip trailing whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e

" Completion settings.
set wildmode=list:longest,list:full

" Ignores + ignores + settings for wild mode
" This also affects services like Ctrl+P
set infercase " ignore case on insert completion
set wildignore+=.DS_Store,*.pyc,*.scssc,COMMIT_EDITMSG
set wildignore+=*/.git/*,*/node_modules/*,*/elm-stuff/*,*/tmp/*,*/.cache/*
set wildignore+=*/build/*,*/dist/*,*/dist-newstyle/*,*/vendor/*,*/pkg/*
set wildignore+=*/plugged/*

" Window management.
set splitbelow " open new horizontal splits below the current
set splitright " open new veritcal splits to the right of the current

" Enable the mouse in terminal Vim, if supported.
set mouse+=a

" Enable balloons (Vim only).
if !has('nvim') && &term =~ '^screen'
  " Extended mouse mode
  " See :help ttymouse
  set ttymouse=sgr
  set balloonexpr=1
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
nmap <silent>SO :source $MYVIMRC<cr>:exe ":echo 'configuration reloaded'"<cr>
nnoremap LC :e $MYVIMRC<cr>

" Faster window navigation?
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

"nmap <leader>. :ALEHover<cr>
"nmap <leader>d :ALEDetail<cr>

" Toggles.
map <leader>i :set invlist<cr>:exe ":echo 'toggling invisibles'"<cr>
"map <leader>. :set number! nonumber?<cr>
map <leader>s :set hlsearch! hlsearch?<cr>
map <leader>w :set wrap! wrap?<cr>
map <leader>p :set paste! nopaste?<cr>

" Toggle Ale fix on save.
nnoremap <leader>a :call AleFixOnSaveToggle()<cr>
function! AleFixOnSaveToggle()
  if get(g:, 'ale_fix_on_save', 1)
    let g:ale_fix_on_save = 0
    echo "Ale Fix-on-Save OFF"
  else
    let g:ale_fix_on_save = 1
    echo "Ale Fix-on-Save ON"
  endif
endfunction

" Toggle the error list
"nmap <script> <silent> E :call ToggleLocationList()<cr>

" Close quickfix, location list, and preview windows.
function! CloseHelperWindows()
  " get current window number
  let n = winnr()
  let isParent = 1
  if &buftype == "quickfix" || &buftype == "locationList"
      let isParent = 0
  endif

  " cycle through windows and close their helper windows. this will set the
  " focus to the last window when complete.
  windo if &buftype == "quickfix" || &buftype == "locationlist" | lclose | endif
  pclose

  " return to the original window
  if isParent == 1
    execute n . "wincmd w"
  endif
endfunction

nmap X :call CloseHelperWindows()<cr>

" Remove empty buffers.
function! g:CleanEmptyBuffers()
  let buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0')
  if !empty(buffers)
    exe 'bw '.join(buffers, ' ')
  endif
endfunction
nmap BC :call g:CleanEmptyBuffers()<cr>

" Session management.
nmap SSA :wa<cr>:mksession! ~/.vim/session/
nmap SL  :wa<cr>:so         ~/.vim/session/

" Switch between spaces and tabs.
nmap <leader>1 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<cr>:exe ":echo 'spaces, 2'"<cr>
nmap <leader>2 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<cr>:exe ":echo 'spaces, 4'"<cr>
nmap <leader>3 :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<cr>:exe ":echo 'tabs, 4'"<cr>
nmap <leader>4 :set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2<cr>:exe ":echo 'tabs, 2'"<cr>

" Visual Mode Blockwise Indent. This keeps the current visual block selection
" active after changing indent with '<' or '>'. Usually the visual block
" selection is lost after you shift it, which is incredibly annoying.
"
" http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
vmap > >gv
vmap < <gv

" How about if just one < or > indents in normal mode?
nmap > >>
nmap < <<

"
" CoC
"

if !has('nvim')
  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Show Diagnostics
  nmap E :CocDiagnostics<cr>

  " Navigate diagnostics
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
end

"
" Ale
"

" General
let g:ale_linters = {}
let g:ale_fixers  = {}
let g:ale_fix_on_save = 0
let g:ale_use_global_executables = 1
if !has('nvim')
  let g:ale_set_balloons = 1
endif

" Go
let g:ale_linters['go'] = ['gopls']
let g:ale_go_langserver_executable = 'gopls'

" Elm
let g:ale_fixers['elm'] = 'format'
"
" Elm language server. See:
" https://github.com/elm-tooling/elm-language-server
"
"let g:ale_linters_ignore = { 'elm': ['make'] } " Disable the default Elm linter
"let g:ale_linters['elm'] = ['elm_ls']

" Haskell
let g:ale_linters['haskell'] = ['hie']
let g:ale_fixers['haskell']  = ['floskell']

" Python
let g:ale_fixers['python']  = ['yapf']
let g:ale_linters['python'] = ['flake8', 'mypy']

" Sass
let g:ale_fixers['scss'] = 'prettier'
let g:ale_scss_prettier_options = '--trailing-comma all --tab-width 4'
let g:ale_scss_prettier_use_local_config = 1

" JavaScript
let g:ale_linters['javascript'] = ['flow', 'eslint']
let g:ale_fixers['javascript'] = ['eslint', 'prettier']
let g:ale_javascript_prettier_options = '--trailing-comma all --tab-width 4'
let g:ale_javascript_prettier_use_local_config = 1

" JSON
let g:ale_fixers['json'] = 'prettier'

" HTML
let g:ale_fixers['html'] = 'prettier'

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

"
" YouCompleteMe (and TabNine)
"

" Remove <Tab> from the list of keys mapped by YCM. We'll use the standard
" ctrl n, ctrl p.
let g:ycm_key_list_select_completion = []

"
" Airline
"
let g:airline#extensions#ale#enabled = 1

"
" GitGutter
"
let g:gitgutter_sign_modified         = '•'
let g:gitgutter_sign_modified_removed = '•-'
let g:gitgutter_set_sign_backgrounds  = 1 " match to SignColumn

"
" NERDTree
"
map <leader>n :NERDTreeToggle<cr>
map <leader>f :NERDTreeFind<cr>
let NERDChristmasTree = 1
let NERDTreeHighlightCursorline = 1
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeHijackNetrw = 1
let NERDTreeIgnore = [
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
nnoremap <c-o> :CtrlPMRUFiles<cr>

let g:ctrlp_max_height = 25
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

"
" JavaScript
"
let g:javascript_plugin_flow = 1

" Curious background-color-erase fix/hack, apparently. We set this
" specifically for Kitty.
"
" https://github.com/kovidgoyal/kitty#using-a-color-theme-with-a-background-color-does-not-work-well-in-vim
let &t_ut=''

"
" Colorizer
"
let g:colorizer_auto_color = 0
"let g:colorizer_auto_filetype='css,scss,vim'
let g:colorizer_use_virtual_text = 0
nmap <leader>c :ColorToggle<cr>

"
" NeoVim Language Server
"
if has('nvim')
lua <<EOF

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "gopls", "elmls", "hls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

EOF
end

"
" nvim-compte
"
if has('nvim')
lua << EOF

-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
    tabnine = {
        sort = false; -- let TabNine do the sorting
        show_prediction_strength = true;
        ignore_pattern = '';
    };

  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

EOF
end

"
" LSPInstall
"
if has('nvim')
lua <<EOF
require'lspinstall'.setup() -- important

local servers = require'lspinstall'.installed_servers()
for _, server in pairs(servers) do
  require'lspconfig'[server].setup{}
end
EOF
endif
