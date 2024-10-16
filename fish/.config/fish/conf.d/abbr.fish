abbr --add bs "brew services"
abbr --add bc "php bin/console"
abbr --add ci "composer install"
abbr --add cu "composer update"
abbr --add d "cd ~/Downloads"
abbr --add p "cd ~/Projects"
abbr --add dotdot --regex '^\.\.+$' --function multicd

# Turn gitconfig aliases into Fish abbreviations
for git_alias in (git config --get-regexp "^alias\." | string replace "alias." "g")
    echo $git_alias | read --delimiter " " --local alias --local command
    abbr --add $alias --set-cursor "git $command"
end
