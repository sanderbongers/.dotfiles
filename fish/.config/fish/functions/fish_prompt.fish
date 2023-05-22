function fish_prompt
    if test -n $SSH_CONNECTION
        set -l host $USER@$hostname
    end
    printf '%s' (set_color cyan) $host (set_color normal) (prompt_pwd) ' $ '
end
