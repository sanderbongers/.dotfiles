#!/usr/bin/env bash

sudo add-apt-repository ppa:git-core/ppa

sudo apt update -y

sudo apt install -y \
stow \
fish \
zoxide \
fzf \
ripgrep \
fd-find \
bat \
exa
