# Functions
autoload up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Builtins
bindkey -e
bindkey "^[b" backward-word                  # ⌥←
bindkey "^[f" forward-word                   # ⌥→
bindkey "^A" beginning-of-line               # ⌘←
bindkey "^E" end-of-line                     # ⌘→
bindkey "^[[A" up-line-or-beginning-search   # ↑
bindkey "^[[B" down-line-or-beginning-search # ↓
bindkey "ç" fzf-cd-widget                    # ⌥c
