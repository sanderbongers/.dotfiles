if command_exists "bat"; then
	export BAT_CONFIG_PATH=$HOME/.batrc
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"

	help() {
		"$@" --help 2>&1 | bat --language=help
	}
fi
