root_dir := $(realpath $(shell dirname $(firstword $(MAKEFILE_LIST))))
target_dir := $(HOME)
brewfile := "$(HOMEBREW_BUNDLE_FILE)"

red := \033[31m
blue := \033[34m
cyan := \033[36m
reset := \033[0m

define assert_command
	if ! command -v $(1) >/dev/null; then \
		echo "${red}Error:${reset} ${blue}$(1)${reset} is not installed, run ${blue}make${reset} ${cyan}install${reset} first"; \
		exit 127; \
	fi
endef

.PHONY: stow
.DEFAULT_GOAL := help
.SILENT:

dump-bundle: ## Write all installed Homebrew packages into the Brewfile (macOS)
	$(call assert_command, brew)
	brew bundle dump --file "$(brewfile)" --force

help: ## Displays this help message
	echo "Available commands:"
	echo ""
	grep "^[^#[:space:]].*:" Makefile | \
	grep -v "^default" | grep -v "^\." | grep -v "=" | \
	awk 'BEGIN {FS = ":.*?## "}; \
		{printf "  ${blue}make${reset} ${cyan}%-15s${reset} %s\n", $$1, $$2}' | \
	sed "s/://"

install: ## Install software packages and configure general settings
	"$(root_dir)"/var/install.sh

install-bundle: ## Install Homebrew packages from the Brewfile (macOS)
	$(call assert_command, brew)
	brew bundle check --file "$(brewfile)" || brew bundle --file "$(brewfile)"

stow: ## (Re)create symlinks for all dotfiles
	$(call assert_command, stow)
	stow --verbose --restow --target "$(target_dir)" */

unstow: ## Delete symlinks for all dotfiles
	$(call assert_command, stow)
	stow --verbose --target "$(target_dir)" --delete */
