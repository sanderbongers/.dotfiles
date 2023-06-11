# https://github.com/junegunn/fzf

set -gx FZF_DEFAULT_OPTS "--height 100% --reverse --multi --exact --bind 'ctrl-/:toggle-preview' --preview-window 'hidden,down,60%'"
set -gx FZF_CTRL_R_OPTS "--header 'Copy: ⌃y' --bind 'ctrl-y:execute-silent(echo -n {} | pbcopy)+abort' --bind 'ctrl-/:ignore'"
set -gx FZF_ALT_C_OPTS "--preview 'exa -1 --level=1 --color=never {}'"

# Use ripgrep to find files
if command -sq rg
    set -gx FZF_DEFAULT_COMMAND "command rg --ignore-file=$HOME/.rgignore --files \$dir 2>/dev/null | sed '1d; s#^\./##'"
    set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND
end

# Use fd to find directories
set -l fd (command -s fd || command -s fdfind)
if command -sq $fd
    set -gx FZF_ALT_C_COMMAND "$fd --ignore-file=$HOME/.rgignore --type directory --hidden"
end

# Use bat to colorize previews
if command -sq bat
    set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --preview 'test -f {} && bat --color always --line-range :500 {}'"
end
