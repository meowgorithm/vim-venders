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
        flow-bin eslint babel-eslint eslint-plugin-react prettier \
        bash-language-server \
        vscode-css-languageserver-bin \
        vscode-html-languageserver-bin \
        vscode-json-languageserver-bin

    # Install Python tools
    pip install flake8 mypy yapf pyls

If you’re working with Haskell you may also want to install the
[Haskll IDE Engine][hie] or [Haskell Language Server][hls]. The latter is a
better choice at this point but also not well supported by Vim yet.


[wim]: https://en.wikipedia.org/wiki/Wim_Wenders
[hie]: https://github.com/haskell/haskell-ide-engine
[hls]: https://github.com/haskell/haskell-language-server
