zsh_plugins=(
	changyuheng/zsh-interactive-cd
	marlonrichert/zsh-autocomplete
	roosta/fif
	unixorn/tumult.plugin.zsh
	wfxr/forgit
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-completions
	zsh-users/zsh-syntax-highlighting
)

# Download plugins
for plugin in "${zsh_plugins[@]}"; do
	plugin_name=$(basename "$plugin")
	plugin_dir="$zsh_plugins_dir/$plugin_name"
	[[ -d "$plugin_dir" ]] || (echo "Installing $plugin_name..." && git clone --quiet "git@github.com:$plugin.git" "$plugin_dir")
done

# Load plugins
for plugin_file in "$zsh_plugins_dir"/*/*.plugin.zsh; do
	source "$plugin_file"
done
