# Load local configuration
set -l local_config (status dirname)/config.local.fish
test -f $local_config; and source $local_config

# Add directories to $PATH
set -l -a path_dirs $HOME/.local/bin $HOME/.config/fish/conf.d/bin $HOME/.cargo/bin /usr/local/opt/ruby/bin /usr/local/opt/coreutils/libexec/gnubin /usr/local/sbin /usr/local/opt/fzf/bin
for dir in $path_dirs
    test -d $dir; and set -gx PATH $dir $PATH
end

# Default editor
if command -sq nvim
    set -gx EDITOR nvim
else
    set -gx EDITOR vim
end

# Lazy load nvm
test -d $HOME/.nvm; and load_nvm >/dev/stderr
