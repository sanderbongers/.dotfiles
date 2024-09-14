# Add identities to ssh-agent
if test "$os" = linux
    command -q keychain; and keychain --eval --quiet --quick $HOME/.ssh/id_ed25519 | source
end
