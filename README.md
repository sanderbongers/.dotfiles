# .dotfiles

> Personal dotfiles

## Prerequisites

- GNU Stow
  - macOS (Homebrew): `$ brew install stow`

## Installation

- `$ git clone git@github.com:sanderbongers/.dotfiles.git ~/.dotfiles`
- `$ cd ~/.dotfiles`
- `$ make install` to install Homebrew packages, set macOS user defaults, etc.
- `$ make stow` to create all simlinks (dry run with `$ make simulate`)
