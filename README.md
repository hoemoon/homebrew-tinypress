# homebrew-tinypress

Homebrew tap for [tiny press](https://github.com/hoemoon/tiny-press) —
a tiny static site generator and its menu-bar macOS companion.

## Install

```bash
brew tap hoemoon/tinypress

# CLI
brew install tinypress

# Menu-bar app (signed + notarized)
brew install --cask tiny-press
```

## Requirements

- macOS 26 (Tahoe) or newer
- Xcode 26+ in `/Applications` (Formula only — needed to compile the CLI from source)

## Updating

```bash
brew update
brew upgrade tinypress
brew upgrade --cask tiny-press
```

## Uninstall

```bash
brew uninstall tinypress
brew uninstall --cask --zap tiny-press   # --zap also removes app data
brew untap hoemoon/tinypress
```

## License

The tap itself is MIT. tiny press is MIT.
