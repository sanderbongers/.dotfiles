# Fish configuration
set -U __fish_git_prompt_show_informative_status true
set -U __fish_git_prompt_showcolorhints true
set -U __fish_git_prompt_showstashstate true
set -U fish_greeting
set -U os (command uname -s | string lower)

# Local fish configuration overrides
set -l local_config $__fish_config_dir/config.local.fish
test -f $local_config; and source $local_config

# Add binary directories to $PATH
set -l -a path_dirs $__fish_config_dir/conf.d/bin
set -a path_dirs $HOME/.local/bin
set -a path_dirs /usr/local/sbin
set -a path_dirs /usr/local/opt/coreutils/libexec/gnubin
set -a path_dirs /usr/local/opt/postgresql@16/bin
set -a path_dirs /usr/local/opt/ruby/bin
set -a path_dirs /usr/local/opt/whois/bin
if command -q brew
    if not set -q brew_prefix
        set -Ux brew_prefix (brew --prefix)
    end
    set -a path_dirs "$brew_prefix"/bin
end
for dir in $path_dirs
    test -d $dir; and fish_add_path --append $dir
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
