if command -sq zoxide
    zoxide init fish | source

    # Additional aliases
    abbr -a -- zr 'zoxide remove'
    abbr -a -- zqi 'zoxide query -i'
    abbr -a -- zq 'zoxide query'
    abbr -a -- za 'zoxide add'
end
