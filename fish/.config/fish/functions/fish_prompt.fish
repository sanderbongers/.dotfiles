function fish_prompt
    set -q fish_color_cwd; or set -U fish_color_cwd normal
    set -q fish_color_host_remote; or set -U fish_color_host_remote cyan
    set -q fish_color_status; or set -U fish_color_status red
    # set -g __fish_git_prompt_char_stateseparator ""
    # set -g __fish_git_prompt_color_untrackedfiles red
    # set -g __fish_git_prompt_show_informative_status true
    # set -g __fish_git_prompt_showcolorhints true
    # set -g __fish_git_prompt_showstashstate true
    # set -g __fish_git_prompt_showuntrackedfiles true
    # set -g __fish_git_prompt_char_cleanstate '✔'
    set -l prompt_symbol '$'

    if not set -q fish_prompt_show_host; or not contains -- $fish_prompt_show_host no false 0
        set_color $fish_color_host_remote
        printf "%s@%s " (whoami) (prompt_hostname)
        set_color normal
    end

    set_color $fish_color_cwd
    printf "%s " (prompt_pwd)
    set_color normal
    printf "%s" (fish_git_prompt)
    printf "$prompt_symbol "
end

function fish_git_prompt
    set -l color_branch green # TODO: Set color to red for other operations as in __fish_git_prompt_operation_branch_bare
    set -l branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if test -z "$branch"
        return
    end

    set_color $color_branch
    printf "%s%s " $branch (git_status_upstream)
    set_color normal
end

function git_status_upstream
    set -l status_upstream ""
    set -l upstream (git rev-parse --abbrev-ref @{upstream} 2>/dev/null)
    set -l count (command git rev-list --count --left-right $upstream...HEAD 2>/dev/null | string replace \t " ")
    echo $count | read -l behind ahead

    switch $count
        case "" # No upstream
        case "0 0"
            set status_upstream "✔"
        case "0 *" # Commits ahead
            set status_upstream "↑$ahead"
        case "* 0" # Commits behind
            set status_upstream "↓$behind"
        case "*" # Diverged
            set status_upstream "↑$ahead↓$behind"
    end

    if test -n $status_upstream
        set status_upstream (set_color white; printf "|%s" $status_upstream; set_color normal)
    end

    echo $status_upstream
end
