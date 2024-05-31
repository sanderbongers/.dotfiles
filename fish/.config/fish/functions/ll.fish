function ll --wraps=eza
    # If installed, use eza as ls replacement
    if command -q eza
        eza --long --all --classify --group --time-style=iso $argv
        return
    end

    ls -lah --color=auto $argv
end
