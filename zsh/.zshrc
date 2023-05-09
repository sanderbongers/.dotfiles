# Fig pre block
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TZ=Europe/Amsterdam

# Prompt
export PS1="%1~ $ "

# Command history
export HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# Options
## Changing directories
setopt auto_cd
setopt auto_pushd
setopt cd_silent
setopt cdable_vars
setopt pushd_ignore_dups
setopt pushd_silent
## Completion
setopt no_auto_list
setopt no_auto_menu
setopt no_list_beep
## Globbing
setopt extended_glob
setopt numeric_glob_sort
setopt globdots
## History
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_functions
## Input/output
setopt interactive_comments

# Functions
autoload up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Zle builtins
bindkey -e
bindkey "^[b" backward-word                  # ⌥←
bindkey "^[f" forward-word                   # ⌥→
bindkey "^A" beginning-of-line               # ⌘←
bindkey "^E" end-of-line                     # ⌘→
bindkey "^[[A" up-line-or-beginning-search   # ↑
bindkey "^[[B" down-line-or-beginning-search # ↓
bindkey "ç" fzf-cd-widget                    # ⌥c

# Environment variables
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
export EDITOR=/usr/bin/vim
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export KEYTIMEOUT=1
export GPG_TTY=$TTY
export HOMEBREW_BREWFILE=$HOME/.config/Brewfile
export HOMEBREW_NO_INSTALL_CLEANUP=1
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export BAT_CONFIG_PATH=$HOME/.batrc

# Aliases
## General commands
alias ll="ls -lahF"
alias la="ls -A"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -Iv"
alias mkdir="mkdir -pv"
## Directory stack
alias d="dirs -v"
for index in {1..9}; do
	alias "$index"="cd +${index}"
	unset index
done
## Git
alias ga="git add"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log --oneline --decorate --graph"
alias gla="git log --oneline --decorate --graph --all"
alias gll="git log --oneline --decorate --graph --stat"
alias glt="git log --graph --decorate --pretty=format:'%C(yellow)%h%Creset%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset'"
alias gp="git push"
alias gpl="git pull"
alias gs="git status -sb"
alias gsh="git show"
## Other
alias tree="tree -a"
alias vim="nvim"

# zsh plugins
zsh_plugins=(
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-syntax-highlighting
	roosta/fif
	unixorn/tumult.plugin.zsh
)
zsh_plugins_dir="$HOME/.config/zsh/plugins"
[[ -d "$zsh_plugins_dir" ]] || mkdir -p "$zsh_plugins_dir"
for plugin in "${zsh_plugins[@]}"; do
	plugin_name=$(basename "$plugin")
	plugin_dir="$zsh_plugins_dir/$plugin_name"
	[[ -d "$plugin_dir" ]] || git clone --quiet "git@github.com:$plugin.git" "$plugin_dir"
done
for plugin_file in "$zsh_plugins_dir"/*/*.plugin.zsh; do source "$plugin_file"; done

# bat
if type bat &>/dev/null; then
	export MANPAGER="sh -c 'col -bx | bat -l man -p'"
	help() {
		"$@" --help 2>&1 | bat --language=help
	}
fi

# fuzzy finder
[[ -f "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"
export FZF_DEFAULT_OPTS="--height 50% --reverse --border --multi --exact --preview '' --preview-window hidden --bind 'ctrl-/:toggle-preview'"
export FZF_CTRL_R_OPTS="--bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'"
if which rg >/dev/null 2>&1; then
	export FZF_DEFAULT_COMMAND="rg --files 2> /dev/null"
	export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
fi
if type fd &>/dev/null; then
	export FZF_ALT_C_COMMAND="fd --type directory --hidden"
fi
if type bat &>/dev/null; then
	export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --preview 'bat --color=always --line-range=:100 {}'"
fi

# NVM
export NVM_DIR="$HOME/.nvm" && [[ -s "$NVM_DIR/nvm.sh" ]] && . "$NVM_DIR/nvm.sh" --no-use

# zoxide
if which zoxide >/dev/null 2>&1; then
	eval "$(zoxide init zsh)"
fi

# VCS info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
	vcs_info
}
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_

# Fig post block
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
