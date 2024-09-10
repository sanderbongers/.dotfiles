function tree --wraps=eza
    # Use eza as replacement, if installed
    if command -q eza
        eza --all --ignore-glob=.git --tree --time-style=default $argv
        return
    end

    if command -q tree
        command tree -a $argv
        return
    end
end
