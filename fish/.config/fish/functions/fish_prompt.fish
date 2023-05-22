function fish_prompt
    set -l host ""
    # Set hostname when connected via ssh
    test -z $SSH_CONNECTION; and set host (set_color $fish_color_host)$USER@$hostname(set_color normal)

    echo (echo $host (prompt_pwd) | string trim) '$ '
end
