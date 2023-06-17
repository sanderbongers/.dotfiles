# https://github.com/sharkdp/bat

if command -sq bat
    set -gx MANPAGER "sh -c 'col -bx | bat --language=man --plain'"
end
