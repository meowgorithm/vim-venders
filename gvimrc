set mousehide

if has('gui_macvim')

    "
    " MacVIM Settings
    "

    colorscheme roshambo

    set fuoptions=maxvert,maxhorz "fullscreen options
    set guioptions-=T "hide toolbar
    set guioptions-=rL "hide scrollbars
    set guioptions-=e "console-style tab labels
    set guifont=Menlo:h12
    set linespace=1
    set antialias

    " Indenting: Bind command-[ and command-] to shift left and right
    nmap <D-]> >>
    nmap <D-[> <<
    vmap <D-]> >>
    vmap <D-[> <<
    imap <D-]> <C-t>
    imap <D-[> <C-d>

    " Command + return for fullscreen
    macmenu Window.Toggle\ Full\ Screen\ Mode key=<D-CR>

    " Window Navigation
    nmap <D-J> <C-W>j
    nmap <D-K> <C-W>k
    nmap <D-H> <C-W>h
    nmap <D-L> <C-W>l

    " Remap new tab key to command + shift + n
    macmenu &File.New\ Tab key=<D-N>

    " Command + d closes the current buffer
    macmenu &Buffers.Delete key=<D-d>

    " Map command + t to fuzzy-file-find like TextMate
    nnoremap <D-t> :CommandT<CR>

    " Unmap MacVim's command + b 'make' mapping
    macmenu &Tools.Make key=<nop>

    " Map command + b to browse buffers
    nnoremap <D-b> :CommandTBuffer<CR>

    " Map command + shift + c to spatn the color picker
    " Requires the PickAColor plugin
    nmap <D-C> :PickHEX<CR>
    vmap <D-C> :PickHEX<CR>
    imap <D-C> <ESC>:PickHEX<CR>a

    " Buffer Switching
    macmenu &Buffers.Next key=<D-lt>
    macmenu &Buffers.Previous key=<D->>

    " Ooh, gestures
    map <SwipeLeft> :bnext<CR>
    map <SwipeRight> :bprevious<CR>

    " Command-Shift-F for Ack
    map <D-F> :Ack<space>

    " Command-e for ConqueTerm
    " Requires the ConqueTerm plugin
    "map <D-e> :call StartTerm()<CR>

    " Command-/ to toggle comments
    " Requires the NERDCommenter plugin
    nmap <D-/> <plug>NERDCommenterToggle<CR>
    imap <D-/> <ESC><plug>NERDCommenterToggle<CR>a

elseif has('gui_gtk')

    "
    " gVim Settings
    "

    colorscheme roshambo

    set guifont=Ubuntu\ Mono\ 12

    set guioptions-=T "hide toolbar
    set guioptions-=M "hide menus
    set guioptions-=rL "hide scrollbars
    set guioptions-=e "console-style tab labels
    set antialias

endif
