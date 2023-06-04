[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"

export FZF_DEFAULT_OPTS="--height 50% --reverse --border --multi --exact --preview '' --preview-window hidden --bind 'ctrl-/:toggle-preview'"
export FZF_CTRL_R_OPTS="--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"

# Use ripgrep to find files
if command_exists "rg"; then
	export FZF_DEFAULT_COMMAND="rg --files 2> /dev/null"
	export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
fi

# Use fd to find directories
if command_exists "fd"; then
	export FZF_ALT_C_COMMAND="fd --type directory --hidden"
fi

# Use bat to colorize previews
if command_exists "bat"; then
	export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview 'test -f {} && bat --color=always --line-range=:100 {}'"
fi
