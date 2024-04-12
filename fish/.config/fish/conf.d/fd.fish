# https://github.com/sharkdp/fd

# Use ripgrep's ignore file
if command -sq fd
    alias fd="fd --ignore-file=$HOME/.rgignore"
end
