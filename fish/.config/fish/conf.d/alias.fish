# General commands
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -Iv"
alias mkdir="mkdir -pv"

# Git
alias groot="cd (git rev-parse --show-toplevel)"
for git_alias in (git config --get-regexp ^alias\. | string replace "alias." "g")
    echo $git_alias | read -d " " -l alias -l command
    alias $alias="git $command"
    complete --command $alias --wraps git
end

# Other
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
