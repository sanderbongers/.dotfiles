function ls --wraps=exa
    # If installed, use exa as ls replacement
    if command -sq exa
        exa --all --group $argv
        return
    end

    command ls -a --color=auto $argv
end
