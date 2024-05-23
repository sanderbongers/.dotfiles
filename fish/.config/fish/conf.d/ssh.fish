# Add identities to ssh-agent
switch (uname -s)
    case Linux
        command -q keychain; and keychain --eval --quiet --quick $HOME/.ssh/id_ed25519 | source
    case Darwin
        /usr/bin/ssh-add --apple-load-keychain -q
end
