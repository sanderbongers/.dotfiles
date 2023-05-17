# Prompt
export PS1="%1~ %(?.$.%F{red}$%f) "

# VCS info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
precmd() {
  vcs_info
  RPROMPT=\$vcs_info_msg_0_
}
