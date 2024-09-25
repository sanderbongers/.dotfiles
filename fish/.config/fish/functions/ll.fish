function ll --wraps=eza
    # If installed, use eza as ls replacement
    if command -q eza
        eza --all --classify --group --long $argv
        return
    end

    ls -lah --color=auto $argv
end
