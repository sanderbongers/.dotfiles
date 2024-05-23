# Fish configuration overrides
set -U __fish_git_prompt_show_informative_status true
set -U __fish_git_prompt_showcolorhints true
set -U fish_color_host cyan
set -U fish_greeting

# Load local fish configuration
set -l local_config $__fish_config_dir/config.local.fish
test -f $local_config; and source $local_config

# Add binary directories to $PATH
set -l -a path_dirs $__fish_config_dir/conf.d/bin
set -a path_dirs (brew --prefix)/bin
set -a path_dirs $HOME/.local/bin
set -a path_dirs /usr/local/opt/coreutils/libexec/gnubin
set -a path_dirs /usr/local/opt/ruby/bin
for dir in $path_dirs
    test -d $dir; and fish_add_path $dir
end
