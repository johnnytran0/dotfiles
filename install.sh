#!/bin/bash

# Variables
dotfiles_repo="git@github.com:johnnytr-n/dotfiles.git"
dotfiles_files=(
    .bash_profile
    .bashrc
    .gitconfig
    .gitignore
    .gitmodules
    .inputrc
    .ssh_config
    .tmux.conf
    .vimrc
    .zprofile
    .zsh
    .zshrc
    .zlogin
)

# Clone dotfiles repository
git clone ${dotfiles_repo} ~/.config/dotfiles

# Ensure directory permissions
chmod 0744 ~/.config/dotfiles/.zsh

# Link dotfiles into home folder (excluding .zsh)
for dotfile in "${dotfiles_files[@]}"; do
    if [[ "$dotfile" != ".zsh" ]]; then
        ln -sf ~/.config/dotfiles/$dotfile ~/$dotfile
        chmod 0644 ~/$dotfile
    fi
done

# Link .zsh with execute permissions
ln -sf ~/.config/dotfiles/.zsh ~/.zsh
chmod 0744 ~/.zsh

# Change user's default shell to Zsh
chsh -s /bin/zsh $USER

