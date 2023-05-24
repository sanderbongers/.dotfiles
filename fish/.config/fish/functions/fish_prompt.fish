function fish_prompt
    set -l host ""
    # Set hostname when connected via ssh
    test $SSH_CONNECTION; and set host (set_color $fish_color_host)$USER@$hostname(set_color normal)

    echo (echo $host (prompt_pwd) (fish_git_prompt) | tr -s " " | string trim) '$ '
end
