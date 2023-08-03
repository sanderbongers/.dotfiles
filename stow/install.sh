#!/usr/bin/env bash

current_dir="$(dirname "$0")"

# Setup and install OS-specific packages
case "$(uname -s)" in
Linux)
	. "$current_dir/install-linux.sh"
	;;
Darwin)
	. "$current_dir/install-macos.sh"
	;;
esac

# Set fish as default shell
shell_path="$(command -v fish)"
if [ "$shell_path" ] && [ "$shell_path" != "$SHELL" ]; then
	# Add to /etc/shells if not present
	if ! grep -Fxq "$shell_path" /etc/shells; then
		echo "$shell_path" | sudo tee -a /etc/shells
	fi

	# Set as default shell
	chsh -s "$shell_path"
fi
