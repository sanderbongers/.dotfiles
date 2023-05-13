function command_exists() {
  if type "$1" &>/dev/null; then
    return 1 # command found
  else
    return 0 # command not found
  fi
}
