# Vim Venders!

A Vim and NeoVim config inspired by the work of [Wim Wenders][wim].

Just checkout to `~/.vim` or (`~/.config/nvim`) and get to work. There are also
a few tools you can install for a better experience:

```bash
# Void Linux
xbps-install -S ripgrep ctags python nodejs npm

# Arch Linux
pacman -S ripgrep ctags python nodejs npm

# macOS
brew install ripgrep ctags python nodejs npm
```

And then:

```bash
# Install Elm and JavaScript tools
npm -g install \
    elm elm-test elm-oracle elm-format @elm-tooling/elm-language-server \
    flow-bin eslint babel-eslint eslint-plugin-react prettier
```

Install some common language servers in Vim:

```
:CocInstall coc-tabnine coc-sh coc-json coc-css coc-html coc-python
```

Install some common language servers in NeoVim:

```
:LspInstall <tab>
```

If you’re working with Haskell you will likely want to install the [Haskell
Language Server][hls], which is probably easiest to install with [GHCUP][ghcup]
these days.

You can also improve TabNine's performance by disabling language server stuff,
since CoC/NeoVim’s Native LSP handles that:

```bash
# Linux
sed -i 's/"ignore_all_lsp": false/"ignore_all_lsp": true/' "$HOME/.config/TabNine/tabnine_config.json"

# MacOS
sed -i '.original' 's/"ignore_all_lsp": false/"ignore_all_lsp": true/' "$HOME/Library/Preferences/TabNine/tabnine_config.json"
```

[wim]: https://www.imdb.com/name/nm0000694/
[hls]: https://github.com/haskell/haskell-language-server
[ghcup]: https://www.haskell.org/ghcup/
