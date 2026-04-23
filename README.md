# homebrew-tap

Homebrew tap for [Dokkimi](https://www.npmjs.com/package/dokkimi) — the Kubernetes sandbox CLI for microservice testing.

## Install

```sh
brew tap dokkimi/tap
brew install dokkimi
```

Or in one command:

```sh
brew install dokkimi/tap/dokkimi
```

## Update

```sh
brew update
brew upgrade dokkimi
```

## Uninstall

```sh
brew uninstall dokkimi
brew untap dokkimi/tap
```

## About

This repo only contains the Homebrew formula for distributing Dokkimi via `brew`. The CLI itself is published to [npm](https://www.npmjs.com/package/dokkimi) and installed by this formula.

The formula is kept up to date automatically — every time a new version of `dokkimi` is published to npm, a GitHub Action updates `Formula/dokkimi.rb` with the new version and checksum.
