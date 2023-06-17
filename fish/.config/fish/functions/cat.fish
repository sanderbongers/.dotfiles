function cat --wraps=bat
    # If installed, use bat as cat replacement
    if command -sq bat
        bat --paging=never $argv
        return
    end

    command cat $argv
end
