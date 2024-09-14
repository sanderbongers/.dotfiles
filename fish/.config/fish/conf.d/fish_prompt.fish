function fish_prompt
    set -q fish_color_cwd; or set -U fish_color_cwd white
    set -q fish_color_host_remote; or set -U fish_color_host_remote cyan

    set -l prompt_login ""
    if not set -q fish_prompt_show_host; or test "$fish_prompt_show_host" != false
        set prompt_login (printf '%s%s@%s%s ' (set_color $fish_color_host_remote) (whoami) (prompt_hostname) (set_color normal))
    end

    echo -n -s $prompt_login (set_color $fish_color_cwd) (prompt_pwd) (set_color normal) (fish_vcs_prompt) (set_color normal) ' $ '
end

function fish_right_prompt
    set -q fish_color_status; or set -U fish_color_status red
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus

    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color --bold $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "✘ " "" "|" "$status_color" "$statusb_color" $last_pipestatus)
    echo -n -s $prompt_status (set_color normal)
end
