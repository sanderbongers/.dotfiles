function vim --wraps=nvim
    # If installed, use neovim as vim replacement
    if command -q nvim
        nvim $argv
        return
    end

    command vim $argv
end
