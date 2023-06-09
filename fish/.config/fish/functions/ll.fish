function ll --wraps=exa
    # If installed, use exa as ls replacement
    if command -sq exa
        exa --long --all --all --classify --group --time-style=iso $argv
        return
    end

    ls -lah --color=auto $argv
end
