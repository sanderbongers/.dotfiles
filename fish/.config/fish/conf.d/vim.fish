# Set default editor
if command -q nvim
    set -gx EDITOR nvim
else
    set -gx EDITOR vim
end
