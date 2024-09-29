function fish_prompt
    set -q fish_color_cwd; or set -U fish_color_cwd normal
    set -q fish_color_host_remote; or set -U fish_color_host_remote cyan
    set -q fish_color_status; or set -U fish_color_status red
    set -g __fish_git_prompt_char_stateseparator ""
    set -g __fish_git_prompt_color_branch green
    set -g __fish_git_prompt_color_untrackedfiles red
    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_showcolorhints true
    set -g __fish_git_prompt_showstashstate true
    set -g __fish_git_prompt_showuntrackedfiles true
    set -l prompt_symbol '$'

    if not set -q fish_prompt_show_host; or not contains -- $fish_prompt_show_host no false 0
        set_color $fish_color_host_remote
        printf "%s@%s" (whoami) (prompt_hostname)
        set_color normal
    end

    set_color $fish_color_cwd
    printf "%s " (prompt_pwd)
    set_color normal
    printf "%s" (fish_git_prompt "%s ")
    printf "$prompt_symbol "
end
