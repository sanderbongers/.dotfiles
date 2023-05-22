function psql --wraps=pgcli
    # If installed, use pgcli as psql replacement
    if command -sq pgcli
        pgcli $argv
        return
    end

    command psql $argv
end
