# https://github.com/dandavison/delta

if command -q delta
    set -gx DELTA_PAGER "less -F -S -R -i -+X"
end
