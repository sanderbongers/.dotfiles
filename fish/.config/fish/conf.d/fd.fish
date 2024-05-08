# https://github.com/sharkdp/fd

# Use ripgrep's ignore file
if command -q fd
    alias fd="fd --ignore-file=$HOME/.rgignore"
end
