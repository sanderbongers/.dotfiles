# General commands
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -Iv"
alias mkdir="mkdir -pv"

# Git
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
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
