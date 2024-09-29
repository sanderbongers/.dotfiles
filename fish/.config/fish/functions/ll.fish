function ll --wraps=eza --description "List contents of directory using long format"
    # If installed, use eza as ls replacement
    if command -q eza
        eza --long --all --classify --octal-permissions --group --time-style=default $argv
        return
    end

    ls -lah --color=auto $argv
end
