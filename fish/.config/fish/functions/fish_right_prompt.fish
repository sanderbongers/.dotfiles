function fish_right_prompt
    set -g __fish_git_prompt_show_informative_status true
    set -g __fish_git_prompt_showcolorhints true
    printf '%s' (fish_git_prompt)
end
