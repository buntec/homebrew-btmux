# homebrew-btmux

Homebrew tap for [btmux](https://github.com/buntec/btmux), a browser-based tmux.

```sh
brew install buntec/btmux/btmux          # server/CLI (macOS arm64, Linux)
brew install --cask buntec/btmux/btmux   # desktop app (macOS arm64)
```

The desktop app is ad-hoc signed, not notarized; the cask clears its quarantine
attribute on install.

Formula and cask are updated automatically by the btmux release workflow via
`scripts/update-homebrew-tap.sh`.
