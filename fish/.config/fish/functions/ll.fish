function ll --wraps=exa
    # If installed, use exa as ls replacement
    if command -sq exa
        exa --long --all --binary --classify --group --time-style=long-iso $argv
        return
    end

    ls -lAh --color=auto $argv
end
