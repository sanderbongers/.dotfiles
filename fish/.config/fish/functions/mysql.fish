function mysql --wraps=mycli
    # If installed, use mycli as mysql replacement
    if command -q mycli
        mycli $argv
        return
    end

    command mysql $argv
end
