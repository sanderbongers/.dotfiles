command_exists() {
  if type "$1" &>/dev/null; then
    return 0 # command found
  else
    return 1 # command not found
  fi
}

bip() {
  local inst=$(brew search "$@" | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst); do
      brew install $prog
    done
  fi
}
