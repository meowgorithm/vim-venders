# Vim Venders!

A Vim config inspired by the work of [Wim Wenders][wim].

## Quick Setup

There’s a setup script included that will create a bunch of directories in
`~/.vim`, symlink `~/.vimrc` and `~/.gvimrc` to `~/.vim/vimrc` and
`~/.vim/gvimrc` respectively, and install a bunch of plugins. Checkout and
setup like so:

    git clone https://github.com/roshambo/vim-venders.git ~/.vim
    cd ~/.vim
    ./setup

## Recommended Utilities

### General
- [The Silver Searcher](https://github.com/ggreer/the_silver_searcher): Fast
  `ack` replacement

### C and stuff like that
- [Exuberant Ctags](http://ctags.sourceforge.net/) (Nerds)

### Elm

There's a bunch of Elm stuff to install. It's easiest to just copy and paste
this in the terminal (assuming you have Node.js and NPM installed):

    npm -g install elm elm-test elm-oracle elm-format

### Go

- [Gometalinter](https://github.com/alecthomas/gometalinter): runs a bunch of
  Go linters all at once.

Also, you should run `:GoInstallBinaries` and [Vim-Go][vimgo] will install all
the other stuff you need.

### JavaScript
- [Node.js](https://nodejs.org/en/): required for [Tern][tern]
- [NPM][npm]: also required for [Tern][tern]
- [ESLint Stuff](https://github.com/jaxbot/syntastic-react) (also covers React)
- [Prettier](https://prettier.io): code formatter (also formats CSS/Sass)

Quick install everything:

    npm -g install eslint babel-eslint eslint-plugin-react prettier

### Python
- [Flake8](https://pypi.python.org/pypi/flake8): Python linter
- [mypy](http://mypy-lang.org): Static type checker
- [yapf](https://github.com/google/yapf): Python code formatter

Quick install everything:

    pip install flake8 mypy yapf

### CoffeeScript
- [CoffeeScript](http://coffeescript.org) obviously
- [CoffeeTags](https://github.com/lukaszkorecki/CoffeeTags): tag browser


[wim]: https://en.wikipedia.org/wiki/Wim_Wenders
[vimgo]: https://github.com/fatih/vim-go
[tern]: http://ternjs.net
[npm]: https://www.npmjs.com
[yarn]: https://yarnpkg.com/
