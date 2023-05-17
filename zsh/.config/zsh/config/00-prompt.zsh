# Prompt
export PS1="%1~ %(?.$.%F{red}$%f) "

# VCS info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
  vcs_info
}
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
