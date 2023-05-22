function tree --wraps=exa
    # Use exa as replacement, if installed
    if command -sq exa
        exa --tree --all --ignore-glob=.git $argv
        return
    end

    command tree -a $argv
end
