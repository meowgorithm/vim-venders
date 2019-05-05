# Vim Venders!

A Vim config inspired by the work of [Wim Wenders][wim].

Checkout to `~/.vim` or (`~/.config/nvim`) and get to work.


## Recommended Utilities


### General

- [RipGrep](https://github.com/BurntSushi/ripgrep)
- [Exuberant Ctags](http://ctags.sourceforge.net/)


### Go

Run `:GoInstallBinaries` and [Vim-Go][vimgo] will install the tools it needs.


### Elm

There's a bunch of Elm stuff to install. It's easiest to just copy and paste
this in the terminal (assuming you have Node.js and NPM installed):

    npm -g install elm elm-test elm-oracle elm-format


### Python

- [Flake8](https://pypi.python.org/pypi/flake8): Linter
- [mypy](http://mypy-lang.org): Static type checker
- [yapf](https://github.com/google/yapf): Code formatter

Quick install everything:

    pip install flake8 mypy yapf


### JavaScript

- [ESLint](https://eslint.org): Linter
- [Flow](https://flow.org): Static type checker
- [Prettier](https://prettier.io): Code formatter (also formats CSS and Sass)

Quick install everything:

    npm -g install flow-bin eslint babel-eslint eslint-plugin-react prettier
