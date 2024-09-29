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
