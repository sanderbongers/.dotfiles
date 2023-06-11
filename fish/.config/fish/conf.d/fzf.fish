# https://github.com/junegunn/fzf

set -gx FZF_DEFAULT_OPTS "--height 50% --reverse --border --multi --exact --preview-window hidden --bind 'ctrl-/:toggle-preview'"
set -gx FZF_ALT_C_OPTS "--preview 'exa -1 --level=1 --color=never {}'"

# Use ripgrep to find files
if command -sq rg
    set -gx FZF_DEFAULT_COMMAND "command rg --ignore-file=$HOME/.rgignore --files \$dir 2>/dev/null | sed '1d; s#^\./##'"
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
end

# Use fd to find directories
set -l fd (command -s fd || command -s fdfind)
if command -sq $fd
    set -gx FZF_ALT_C_COMMAND "$fd --type directory"
end

# Use bat to colorize previews
if command -sq bat
    set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --preview 'test -f {} && bat --color always --line-range :500 {}'"
end
