#!/usr/bin/env bash

if [[ "$1" != "linux" ]]; then
	echo "Not on Linux, skipping..."
	exit 1
fi

sudo apt update -y
sudo apt install -y \
	bat \
	fd-find \
	fish \
	fzf \
	keychain \
	ripgrep \
	stow \
	zoxide

# In Debian, fd is called fdfind, so create a symbolic link
ln -s "$(which fdfind)" ~/.local/bin/fd

# Install latest version of Neovim through Snap
sudo snap install nvim --classic

# Install eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# shellcheck disable=SC2035
stow --target "$HOME" */
