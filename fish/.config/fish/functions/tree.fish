function tree --wraps=exa
    # Use exa as replacement, if installed
    if command -sq exa
        exa --tree --all --ignore-glob=.git $argv
        return
    end

    if command -sq tree
        command tree -a $argv
        return
    end
end
