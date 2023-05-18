# Directory stack
alias d="dirs -v"
for index in {1..9}; do
  alias "$index"="cd +${index}"
  unset index
done

# General commands
alias ls="ls --color=auto"
alias ll="ls --color=auto -lahF"
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -Iv"
alias mkdir="mkdir -pv"
alias tree="tree -a"

# Git
# alias ga="git add"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gds="git diff --staged"
alias gl="git log --graph --pretty=format:'%C(auto)%h%d %s %C(black)%C(bold)%cr %C(blue)%an%Creset' --color=always --abbrev-commit --date=relative"
alias gls="git log --graph --pretty=format:'%C(auto)%h%d %s %C(black)%C(bold)%cr %C(blue)%an%Creset' --color=always --abbrev-commit --date=relative --stat"
alias gp="git push"
alias gpl="git pull"
alias gs="git status -sb"
alias gsh="git show"
alias groot='cd $(git rev-parse --show-toplevel)'

# Other
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Tool replacements
if command_exists "exa"; then
  unalias ls && alias ls="exa"
  unalias ll && alias ll="exa --long --all --binary --classify --group --time-style=long-iso"
  unalias tree && alias tree="exa --tree --all --ignore-glob=.git"
fi
if command_exists "bat"; then alias cat="bat"; fi
if command_exists "gsed"; then alias sed="gsed"; fi
if command_exists "gwhich"; then alias which="(alias; declare -f) | gwhich --tty-only --read-alias --read-functions --show-tilde --show-dot"; fi
if command_exists "nvim"; then alias vim="nvim"; fi
if command_exists "pgcli"; then alias psql="pgcli"; fi
