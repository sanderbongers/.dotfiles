# https://github.com/sharkdp/bat

if command -sq bat
    set -gx BAT_CONFIG_PATH $HOME/.batrc
    set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"
end
