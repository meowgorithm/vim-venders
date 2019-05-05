# Vim Venders!

A Vim config inspired by the work of [Wim Wenders][wim].


## Quick Setup

There’s a setup script included that will create a bunch of directories in
`~/.vim`, symlink `~/.vimrc` to `~/.vim/vimrc` and install a bunch of plugins.

Make sure you have [Make], [Node.js][node] and [NPM][npm] installed (for [Tern] and
[YouCompleteMe][ycm]) and then run the following:

    git clone https://github.com/meowgorithm/vim-venders.git ~/.vim
    cd ~/.vim
    make

On MacOS, [Make][make] is included with [Xcode][xcode]. If you're on Linux, you
probably already have it installed, and if you don't, you probably know
how to install it.


## Recommended Utilities


### General

- [RipGrep](https://github.com/BurntSushi/ripgrep)
- [Exuberant Ctags](http://ctags.sourceforge.net/)


### Elm

There's a bunch of Elm stuff to install. It's easiest to just copy and paste
this in the terminal (assuming you have Node.js and NPM installed):

    npm -g install elm elm-test elm-oracle elm-format


### Go

Run `:GoInstallBinaries` and [Vim-Go][vimgo] will install all the other stuff
you need.


### JavaScript

- [Node.js](https://nodejs.org/en/): Required for [Tern][tern]
- [NPM][npm]: Also required for [Tern][tern]
- [ESLint](https://eslint.org): Linter
- [Flow](https://flow.org): Static type checker
- [Prettier](https://prettier.io): Code formatter (also formats CSS/Sass)

Quick install everything:

    npm -g install flow eslint babel-eslint eslint-plugin-react prettier


### Python

- [Flake8](https://pypi.python.org/pypi/flake8): Linter
- [mypy](http://mypy-lang.org): Static type checker
- [yapf](https://github.com/google/yapf): Code formatter

Quick install everything:

    pip install flake8 mypy yapf


[wim]: https://en.wikipedia.org/wiki/Wim_Wenders
[make]: https://www.gnu.org/software/make/
[xcode]: https://developer.apple.com/xcode/
[vimgo]: https://github.com/fatih/vim-go
[node]: https://nodejs.org/en/
[tern]: http://ternjs.net
[npm]: https://www.npmjs.com
[yarn]: https://yarnpkg.com/
[ycm]: https://valloric.github.io/YouCompleteMe/
