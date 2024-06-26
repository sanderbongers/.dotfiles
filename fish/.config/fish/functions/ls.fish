function ls --wraps=eza
    # If installed, use eza as ls replacement
    if command -q eza
        eza --all --group $argv
        return
    end

    command ls -A --color=auto $argv
end
