# Fish configuration
set -U fish_greeting ""

# Local fish configuration overrides
set -l local_config $__fish_config_dir/config.local.fish
test -f $local_config; and source $local_config

# Add binary directories to $PATH
set -l -a path_dirs $__fish_config_dir/conf.d/bin
set -a path_dirs ~/.local/bin
set -a path_dirs /usr/local/sbin
set -a path_dirs /usr/local/opt/coreutils/libexec/gnubin
set -a path_dirs /usr/local/opt/postgresql@16/bin
set -a path_dirs /usr/local/opt/ruby/bin
command -q brew; and set -a path_dirs (brew --prefix)/bin
for dir in $path_dirs
    fish_add_path $dir
end

# Prevent commands starting with a space from being written to history file
function fish_preexec --on-event fish_preexec
    if string match --regex --quiet "^ " $argv
        set -x fish_private_mode 1
    end
end

# Install and/or enable iTerm2 shell integration
set -l iterm2_shell_integration ~/.iterm2_shell_integration.fish
if not test -e $iterm2_shell_integration
    curl -L https://iterm2.com/shell_integration/fish -o $iterm2_shell_integration
end
source $iterm2_shell_integration
