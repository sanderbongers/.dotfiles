# https://github.com/junegunn/fzf

bind \u00E7 fzf-cd-widget

set -gx FZF_DEFAULT_OPTS "--height 50% --reverse --border --multi --exact --cycle --preview-window hidden --bind 'ctrl-/:toggle-preview'"

# Use ripgrep to find files
if command -sq rg
    set -gx FZF_DEFAULT_COMMAND "rg --files 2>/dev/null"
end

# Use fd to find directories
set -l fd (command -s fd || command -s fdfind)
if command -sq $fd
    set -gx FZF_ALT_C_COMMAND "$fd --type directory"
end

# Use bat to colorize previews
if command -sq bat
    set -gx FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --preview 'test -f {} && bat --color=always {}'"
end
