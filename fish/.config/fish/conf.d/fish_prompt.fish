function fish_prompt
    if not set -q fish_prompt_show_host; or test "$fish_prompt_show_host" != false
        set_color $fish_color_host_remote
        printf '%s@%s ' $USER (prompt_hostname)
        set_color normal
    end

    set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    set_color normal
    printf '%s' (fish_vcs_prompt)
    set_color normal
    printf ' $ '
end
