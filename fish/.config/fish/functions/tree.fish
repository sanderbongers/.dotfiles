function tree --wraps=exa
    # Use exa as replacement, if installed
    if command -q exa
        exa --tree --all --ignore-glob=.git $argv
        return
    end

    if command -q tree
        command tree -a $argv
        return
    end
end
