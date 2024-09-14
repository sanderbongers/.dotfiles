# Turn gitconfig aliases into Fish aliases
for git_alias in (git config --get-regexp "^alias\." | string replace "alias." "g")
    echo $git_alias | read --delimiter " " --local alias --local command
    alias $alias="git $command"
    complete --command $alias --wraps git
end

# Abbrevations
abbr --add bs "brew services"
abbr --add bc "php bin/console"

# Disable Forgit aliases
set -x FORGIT_NO_ALIASES true
