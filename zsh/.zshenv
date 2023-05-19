# Set up zsh directory
zsh_dir="$HOME/.config/zsh"
[[ -d "$zsh_dir" ]] || mkdir -p "$zsh_dir"

# Set up configuration files directory
zsh_config_dir="$zsh_dir/config"
[[ -d "$zsh_config_dir" ]] || mkdir -p "$zsh_config_dir"

# Set up plugins directory
zsh_plugins_dir="$zsh_dir/plugins"
[[ -d "$zsh_plugins_dir" ]] || mkdir -p "$zsh_plugins_dir"
