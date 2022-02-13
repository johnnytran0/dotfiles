# Terminal runs a login shell by default
# https://apple.stackexchange.com/a/51038
if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi