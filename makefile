ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
TARGET_DIR=~

default:
	@echo "Usage: make [install|stow|simulate|dump-bundle|clean]"

install: stow
	@$(ROOT_DIR)/stow/install.sh

stow:
	@stow --verbose --restow --target $(TARGET_DIR) */

simulate:
	@stow --verbose --restow --target $(TARGET_DIR) --simulate */

dump-bundle:
	@brew bundle dump --no-restart --force

clean:
	@stow --verbose --target ~ --delete */

.PHONY: stow
