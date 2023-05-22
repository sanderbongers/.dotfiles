function fish_prompt
    if test -z $SSH_CONNECTION
        set -l host $USER@$hostname
    end
    printf '%s' (set_color cyan) $host (set_color normal) (prompt_pwd) ' $ '
end
