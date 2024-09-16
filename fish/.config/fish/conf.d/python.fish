if command -q pyenv
    set -q PYENV_ROOT; or set -g PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin

    pyenv init - | source
end
