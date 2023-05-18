# Install (one or multiple) selected application(s)
# Mnemonic [B]rew [I]nstall [P]ackage
bip() {
  local packages=$(brew search "$@" | fzf -m)

  if [[ $packages ]]; then
    for package in $(echo $packages); do
      brew install $package
    done
  fi
}

# Update (one or multiple) selected application(s)
# Mnemonic [B]rew [U]pdate [P]ackage
bup() {
  local packages=$(brew leaves | fzf -m)

  if [[ $packages ]]; then
    for package in $(echo $packages); do
      brew upgrade $package
    done
  fi
}

# Delete (one or multiple) selected application(s)
# Mnemonic [B]rew [D]elete [P]ackage
bdp() {
  local packages=$(brew leaves | fzf -m)

  if [[ $packages ]]; then
    for package in $(echo $packages); do
      brew uninstall $package
    done
  fi
}
