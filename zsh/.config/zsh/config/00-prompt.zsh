# VCS info
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%F{248} %r/%S (%b)%f'
precmd() {
  vcs_info
}

# Prompts
PROMPT='%1~ $ '
RPROMPT='${vcs_info_msg_0_}'
