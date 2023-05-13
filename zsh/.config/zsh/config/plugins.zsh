zsh_plugins=(
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-syntax-highlighting
  roosta/fif
  unixorn/tumult.plugin.zsh
)

# Download plugins
for plugin in "${zsh_plugins[@]}"; do
  plugin_name=$(basename "$plugin")
  plugin_dir="$zsh_plugins_dir/$plugin_name"
  [[ -d "$plugin_dir" ]] || git clone --quiet "git@github.com:$plugin.git" "$plugin_dir"
done

# Load plugins
for plugin_file in "$zsh_plugins_dir"/*/*.plugin.zsh; do
  source "$plugin_file"
done
