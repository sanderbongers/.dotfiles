# Default editor
if command -sq nvim
    set -gx EDITOR nvim
else
    set -gx EDITOR vim
end

# Lazy load nvm
load_nvm >/dev/stderr
