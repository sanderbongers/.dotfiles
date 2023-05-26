# Load zsh configuration files
for config_file in "$zsh_config_dir"/*.zsh &>/dev/null; do
	source "$config_file"
done
