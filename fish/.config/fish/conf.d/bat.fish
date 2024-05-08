# https://github.com/sharkdp/bat

if command -q bat
    set -gx MANPAGER "sh -c 'col -bx | bat --language=man --plain'"
end
