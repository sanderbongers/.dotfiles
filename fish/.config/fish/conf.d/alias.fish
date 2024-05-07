# General commands
alias cp="cp -iv"
alias rm="rm -Iv"
alias mkdir="mkdir -pv"
alias mv="mv -iv"
alias stat="stat -x"

# Git
alias groot="cd (git rev-parse --show-toplevel)"
for git_alias in (git config --get-regexp "^alias\." | string replace "alias." "g")
    echo $git_alias | read -d " " -l alias -l command
    alias $alias="git $command"
    complete --command $alias --wraps git
end

# Miscellaneous
alias myip="curl https://ipinfo.io"

# Abbrevations
abbr --add bs "brew services"
abbr --add gem "brew gem"
