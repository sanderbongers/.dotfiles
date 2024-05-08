function ll --wraps=exa
    # If installed, use exa as ls replacement
    if command -q exa
        exa --long --all --classify --group --time-style=iso $argv
        return
    end

    ls -lah --color=auto $argv
end
