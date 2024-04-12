ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
TARGET_DIR=$(HOME)

default:
	@echo "Usage: make [install|stow|simulate|dump-bundle|clean]"

install:
	@$(ROOT_DIR)/stow/install.sh

stow:
	@stow --verbose --restow --target $(TARGET_DIR) */

simulate:
	@stow --verbose --restow --target $(TARGET_DIR) --simulate */

dump-bundle:
	@brew bundle dump --file ~/.dotfiles/homebrew/.config/homebrew/Brewfile --force

clean:
	@stow --verbose --target $(TARGET_DIR) --delete */

.PHONY: stow
