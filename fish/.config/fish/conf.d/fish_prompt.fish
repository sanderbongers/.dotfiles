function fish_prompt
    set -q fish_color_cwd; or set -U fish_color_cwd normal
    set -q fish_color_host_remote; or set -U fish_color_host_remote cyan
    set -q fish_color_status; or set -U fish_color_status red
    set -l prompt_symbol '$'

    if not set -q fish_prompt_show_host; or contains -- $fish_prompt_show_host yes true 1
        set_color $fish_color_host_remote
        printf "%s@%s" (whoami) (prompt_hostname)
        set_color normal
    end

    set_color $fish_color_cwd
    printf "%s" (prompt_pwd)
    set_color normal
    printf "%s" (fish_git_prompt " %s")
    printf " $prompt_symbol "
end

function fish_right_prompt
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status

    set -l left_brace "✘ "
    set -l right_brace ""
    set -l separator " "
    set -l brace_sep_color (set_color $fish_color_status)
    set -l status_color (set_color --bold $fish_color_status)

    set -l prompt_status (__fish_print_pipestatus $left_brace $right_brace $separator $brace_sep_color $status_color $last_pipestatus)

    printf "%s" $prompt_status
end
