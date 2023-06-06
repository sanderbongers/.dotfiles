function ripgrep
    set -f rg_prefix "rg --column --line-number --no-heading --color=always --smart-case"

    rm -f /tmp/rg-fzf-{r,f}

    : | FZF_DEFAULT_OPTS="" fzf
    --ansi
    --disabled
    --query $argv
    --bind "start:reload:$rg_prefix {q}"
    --bind "change:reload:sleep 0.1; $rg_prefix {q} || true"
    --bind "ctrl-f:unbind(change,ctrl-f)+change-prompt(2. fzf> )+enable-search+rebind(ctrl-r)+transform-query(echo {q} > /tmp/rg-fzf-r; cat /tmp/rg-fzf-f)"
    --bind "ctrl-r:unbind(ctrl-r)+change-prompt(1. ripgrep> )+disable-search+reload($rg_prefix {q} || true)+rebind(change,ctrl-f)+transform-query(echo {q} > /tmp/rg-fzf-f; cat /tmp/rg-fzf-r)"
    --color "hl:-1:underline,hl+:-1:underline:reverse"
    --prompt "1. ripgrep> "
    --delimiter :
    --header "╱ CTRL-R (ripgrep mode) ╱ CTRL-F (fzf mode) ╱"
    --preview "bat --style=default --color=always {1} --highlight-line {2}"
    --preview-window "up,60%,border-bottom,+{2}+3/3,~3"
    --bind "enter:become(vim {1} +{2})"
end
