#!/bin/bash

DOTFILES_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $DOTFILES_DIR
git submodule update --init --recursive
cd $HOME

if [ -f "$HOME/.zshrc" ]; then
    mv $HOME/.zshrc $HOME/.zshrc_old
fi
if [ -f "$HOME/.vimrc" ]; then
    mv $HOME/.vimrc $HOME/.vimrc_old
fi
if [ -f "$HOME/.zshrc" ]; then
    mv $HOME/.gitconfig $HOME/.gitconfig_old
fi

if [ ! -f "$DOTFILES_DIR $HOME/.dotfiles" ]; then
    ln -s $DOTFILES_DIR $HOME/.dotfiles
fi

ln -s $DOTFILES_DIR/zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/vimrc $HOME/.vimrc
ln -s $DOTFILES_DIR/gitconfig $HOME/.gitconfig

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
