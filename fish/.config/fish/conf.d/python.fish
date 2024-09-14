set -gx PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin

if command -q pyenv
    eval (pyenv init - --no-rehash | string collect)
end
