# Store SSH key passphrase in keychain
if test (os) = darwin
    if not ssh-add -l >/dev/null
        set -l ssh_key_path ~/.ssh/id_ed25519
        test -f "$ssh_key_path" && /usr/bin/ssh-add --apple-use-keychain "$ssh_key_path"
    end
end

# Add identity to ssh-agent
if test (os) = linux
    command -q keychain; and keychain --eval --quiet --quick $HOME/.ssh/id_ed25519 | source
end
