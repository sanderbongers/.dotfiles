function ls --wraps=eza --description "List contents of directory"
    # If installed, use eza as ls replacement
    if command -q eza
        eza --all $argv
        return
    end

    command ls -A --color=auto $argv
end
