function help
    if test -z $argv
        echo "Usage: help <command>"
        return
    end

    if command -sq bat
        $argv --help | bat --language=help
        return
    end

    $argv --help
end
