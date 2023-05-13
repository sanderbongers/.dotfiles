function command_exists() {
  if type "$1" &>/dev/null; then
    return 0 # command found
  else
    return 1 # command not found
  fi
}
