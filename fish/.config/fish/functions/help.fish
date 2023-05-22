function help
    if test -z $argv
        echo "Usage: help <command>"
        return
    end

    if command -sq bat
        $argv --help 2>&1 | bat --language=help
        return
    end

    $argv --help 2>&1
end
