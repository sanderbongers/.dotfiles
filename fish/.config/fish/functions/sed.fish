function sed --wraps=gsed
    # If installed, use gsed as sed replacement
    if command -q gsed
        gsed $argv
        return
    end

    command sed $argv
end
