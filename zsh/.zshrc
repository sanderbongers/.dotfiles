# Fig pre block
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

readonly zsh_dir="$HOME/.config/zsh"

# Load zsh configuration files
for config_file in "$zsh_dir"/config/*.zsh; do
	source "$config_file"
done

# Fig post block
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
