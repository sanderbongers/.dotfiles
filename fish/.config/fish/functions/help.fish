function help
    if test -z $argv
        echo "Usage: help <command>"
        return
    end

    if command -q bat and command -q $argv
        "$argv" --help | bat --language=help
        return
    end

    $argv --help
end
