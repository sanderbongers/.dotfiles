function tree --wraps=eza
    # Use eza as replacement, if installed
    if command -q eza
        eza --tree --all --ignore-glob=.git $argv
        return
    end

    if command -q tree
        command tree -a $argv
        return
    end
end
