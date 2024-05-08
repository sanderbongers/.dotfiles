function ls --wraps=exa
    # If installed, use exa as ls replacement
    if command -q exa
        exa --all --group $argv
        return
    end

    command ls -A --color=auto $argv
end
