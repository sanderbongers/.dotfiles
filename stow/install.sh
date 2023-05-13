#!/usr/bin/env bash

# Install Homebrew packages
if type "brew" &>/dev/null; then
  brew bundle install
fi
