# Load zsh configuration files
for config_file in "$zsh_config_dir"/*.zsh; do
	source "$config_file"
done
