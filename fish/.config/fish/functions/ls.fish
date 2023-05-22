function ls --wraps=exa
    # If installed, use exa as ls replacement
    if command -sq exa
        exa $argv
        return
    end

    command ls --color=auto $argv
end
