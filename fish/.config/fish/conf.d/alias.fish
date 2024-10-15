# Turn gitconfig aliases into Fish aliases
for git_alias in (git config --get-regexp "^alias\." | string replace "alias." "g")
    echo $git_alias | read --delimiter " " --local alias --local command
    abbr --add $alias "git $command"
end

# Abbrevations
abbr --add bs "brew services"
abbr --add bc "php bin/console"
abbr --add dotdot --regex '^\.\.+$' --function multicd
