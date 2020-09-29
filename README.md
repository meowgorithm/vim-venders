# Vim Venders!

A Vim config inspired by the work of [Wim Wenders][wim].

Checkout to `~/.vim` or (`~/.config/nvim`) and get to work.

There are also a few tools you can install for a better experience:

MacOS:

    brew install ripgrep ctags python nodejs npm

or Arch Linux:

    sudo pacman -S ripgrep ctags python nodejs npm

And then:

    # Install Elm and JavaScript tools
    npm -g install \
        elm elm-test elm-oracle elm-format @elm-tooling/elm-language-server \
        flow-bin eslint babel-eslint eslint-plugin-react prettier

    # Install Python tools
    pip install flake8 mypy yapf pyls

Install some common language servers in Vim:

    `:CocInstall coc-tabnine coc-sh coc-json coc-css coc-html coc-python

If you’re working with Haskell you will probably want to install the [Haskell
Language Server][hls].

You can also improve TabNine's performance by disabling language server stuff,
since CoC handles that:

    # MacOS
    sed -i '.original' 's/"ignore_all_lsp": false/"ignore_all_lsp": true/' "$HOME/Library/Preferences/TabNine/tabnine_config.json"

    # Linux
    sed -i 's/"ignore_all_lsp": false/"ignore_all_lsp": true/' "$HOME/.config/TabNine/tabnine_config.json"


[wim]: https://en.wikipedia.org/wiki/Wim_Wenders
[hie]: https://github.com/haskell/haskell-ide-engine
[hls]: https://github.com/haskell/haskell-language-server
