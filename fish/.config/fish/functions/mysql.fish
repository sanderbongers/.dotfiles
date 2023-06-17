function mysql --wraps=mysql
    # If installed, use mycli as mysql replacement
    if command -sq mycli
        mycli $argv
        return
    end

    command mysql $argv
end
