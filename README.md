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

- [Flake8](https://pypi.python.org/pypi/flake8) (Python)
- [The Silver Searcher](https://github.com/ggreer/the_silver_searcher) (Fast `ack` replacement)
- [ESLint Stuff](https://github.com/jaxbot/syntastic-react) (JavaScript)
- [CoffeeTags](https://github.com/lukaszkorecki/CoffeeTags) (CoffeeScript)
- [Exuberant Ctags](http://ctags.sourceforge.net/) (Nerds)
- [Node.js](https://nodejs.org/en/) (Required for [Tern][tern])
- [Yarn][yarn] or [NPM][npm] (Also required for [Tern][tern])
- [Prettier](https://prettier.io) for JavaScript and CSS/SCSS formatting

[wim]: https://en.wikipedia.org/wiki/Wim_Wenders
[tern]: http://ternjs.net
[npm]: https://www.npmjs.com
[yarn]: https://yarnpkg.com/
