function sed --wraps=gsed
    # If installed, use gsed as sed replacement
    if command -sq gsed
        gsed $argv
        return
    end

    command sed $argv
end
