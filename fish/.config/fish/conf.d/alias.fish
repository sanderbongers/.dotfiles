# General commands
alias cp="cp -iv"
alias rm="rm -Iv"
alias mkdir="mkdir -pv"
alias mv="mv -iv"

# Turn gitconfig aliases into Fish aliases
alias groot="cd (git rev-parse --show-toplevel)"
for git_alias in (git config --get-regexp "^alias\." | string replace "alias." "g")
    echo $git_alias | read --delimiter " " --local alias --local command
    alias $alias="git $command"
    complete --command $alias --wraps git
end

# Miscellaneous
alias myip="curl -s http://httpbin.org/ip | jq --raw-output '.[]'"

# Abbrevations
abbr --add bs "brew services"

# Disable Forgit aliases
set -x FORGIT_NO_ALIASES true
