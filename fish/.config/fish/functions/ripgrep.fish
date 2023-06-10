function ripgrep
    set -f rg_prefix "rg --column --line-number --no-heading --color=always --smart-case --hidden"

    : | FZF_DEFAULT_OPTS="" fzf \
        --ansi \
        --disabled \
        --query "$argv" \
        --height 100% \
        --reverse \
        --border none \
        --bind "start:reload:$rg_prefix {q}" \
        --bind "change:reload:sleep 0.05; $rg_prefix {q} || true" \
        --delimiter : \
        --preview 'bat --style=default --color=always {1} --highlight-line {2}' \
        --preview-window 'down,60%,border-top,+{2}+3/3,~3' \
        --bind 'enter:become(vim {1} +{2})'
end
