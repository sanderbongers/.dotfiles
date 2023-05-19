autoload -Uz compinit && compinit

# Load completion listing module
zmodload zsh/complist

# Make Tab go straight to the menu and cycle there
bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete
