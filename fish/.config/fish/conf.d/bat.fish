if command -sq bat
    set -gx BAT_CONFIG_PATH $HOME/.batrc
    set -gx BAT_PAGER less -RF --mouse
    set -gx MANPAGER "sh -c 'col -bx | bat --language=man --plain'"
end
