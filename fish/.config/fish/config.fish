# Fish configuration overrides
set -U fish_greeting
set -U fish_color_host cyan
set -U __fish_git_prompt_show_informative_status true
set -U __fish_git_prompt_showcolorhints true

# Load local fish configuration
set -l local_config $__fish_config_dir/config.local.fish
test -f $local_config; and source $local_config

# Add binary directories to $PATH
set -l -a path_dirs $__fish_config_dir/conf.d/bin
set -a path_dirs (brew --prefix)/bin
set -a path_dirs $HOME/.local/bin
set -a path_dirs (brew --prefix)/opt/fzf/bin/
set -a path_dirs "/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
for dir in $path_dirs
    test -d $dir; and fish_add_path $dir
end

# Default editor
if command -sq nvim
    set -gx EDITOR nvim
else
    set -gx EDITOR vim
end

# Add identities to ssh-agent
switch (uname -s)
    case Linux
        command -sq keychain; and keychain --eval --quiet --quick $HOME/.ssh/id_ed25519 | source
    case Darwin
        /usr/bin/ssh-add --apple-load-keychain -q
end
