# Vim Venders!

A Vim and NeoVim config inspired by the work of [Wim Wenders][wim].

Just checkout to `~/.vim` or (`~/.config/nvim`) and get to work. There are also
a few tools you can install for a better experience:

```bash
# Void Linux
xbps-install -S ripgrep ctags python nodejs npm jq

# Arch Linux
pacman -S ripgrep ctags python nodejs npm jq

# macOS
brew install ripgrep ctags python nodejs npm jq sponge
```

And then:

```bash
# Install Elm tools
npm -g install elm elm-test elm-oracle elm-format @elm-tooling/elm-language-server
```

The following language servers are preconfigured in [CoC][coc]:

* Go
* Haskell
* Elm
* Nix

Install some other common language servers:

```
:CocInstall coc-tabnine coc-vimlsp coc-rust-analyzer coc-sh coc-tsserver coc-json coc-css coc-html
```

If you’re working with Haskell you will likely want to install the [Haskell
Language Server][hls], which is probably easiest to install with [GHCUP][ghcup]
these days.

## TabNine

[TabNine][tn] is an AI-powered code completer. Install it with CoC:

```
:CocInstall coc-tabnine
```

You can improve TabNine's performance by disabling its internal language
server, since CoC/NeoVim’s Native LSP handles that. Included is a script for
toggling TabNine's' LSP capabilities on and off:

```bash
./tabnine-lsp off
```

[wim]: https://www.imdb.com/name/nm0000694/
[hls]: https://github.com/haskell/haskell-language-server
[ghcup]: https://www.haskell.org/ghcup/
[coc]: https://github.com/neoclide/coc.nvim
[tn]: https://www.tabnine.com
