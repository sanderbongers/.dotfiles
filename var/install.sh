#!/usr/bin/env bash
# shellcheck disable=SC1091

current_dir="$(dirname "$0")"
os=$(command uname -s | tr '[:upper:]' '[:lower:]')

# Setup and install OS-specific packages
case "$os" in
linux)
	. "$current_dir/install-linux.sh" "$os"
	;;
darwin)
	. "$current_dir/install-macos.sh" "$os"
	;;
esac

# Set fish as default shell
shell_path="$(command -v fish)"
if [ "$shell_path" ] && [ "$shell_path" != "$SHELL" ]; then
	# Add fish to /etc/shells if not present
	if ! grep -Fxq "$shell_path" /etc/shells; then
		echo "$shell_path" | sudo tee -a /etc/shells
	fi

	# Set as default shell
	chsh -s "$shell_path"

	# Set fish theme to use ANSI colors set in iTerm2
	fish_config theme save "fish default"
fi
