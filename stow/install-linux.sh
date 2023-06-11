#!/usr/bin/env bash

sudo add-apt-repository ppa:git-core/ppa

sudo apt update -y

sudo apt install -y \
	bat \
	exa \
	fd-find \
	fish \
	fzf \
	ripgrep \
	stow \
	zoxide \
    nvim
