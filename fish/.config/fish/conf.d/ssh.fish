# Store SSH key passphrase in keychain
if string match -q (uname) -- Darwin
    if not ssh-add -l >/dev/null
        set -l ssh_key_path ~/.ssh/id_ed25519
        test -f "$ssh_key_path" && /usr/bin/ssh-add --apple-use-keychain "$ssh_key_path"
    end
end

# Add identity to ssh-agent
if string match -q (uname) -- Linux
    command -q keychain; and keychain --eval --quiet --quick $HOME/.ssh/id_ed25519 | source
end
