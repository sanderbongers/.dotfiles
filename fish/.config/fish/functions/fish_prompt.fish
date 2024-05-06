function fish_prompt
    set -l host ""
    if not set -q fish_prompt_show_host; or test "$fish_prompt_show_host" != false
        set host (set_color $fish_color_host)$USER@$hostname(set_color normal)
    end

    echo (echo $host (prompt_pwd) (fish_git_prompt) | tr -s " " | string trim) '$ '
end
