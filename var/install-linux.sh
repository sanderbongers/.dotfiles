#!/usr/bin/env bash

if [ "$(uname -s)" != "Linux" ]; then
	echo "Not on Linux, skipping..."
	exit 1
fi

sudo add-apt-repository ppa:git-core/ppa
sudo apt update -y
sudo apt install -y \
	bat \
	eza \
	fd-find \
	fish \
	fzf \
	keychain \
	neovim \
	ripgrep \
	stow \
	zoxide

# shellcheck disable=SC2035
stow --target "$HOME" */
