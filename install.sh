#!/bin/bash

DOTFILES_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd $DOTFILES_DIR
git submodule update --init --recursive
cd $HOME

mv $HOME/.zshrc $HOME/.zshrc_old
mv $HOME/.gitconfig $HOME/.gitconfig_old

ln -s $DOTFILES_DIR $HOME/.dotfiles
ln -s $DOTFILES_DIR/zshrc $HOME/.zshrc
ln -s $DOTFILES_DIR/vimrc $HOME/.vimrc
ln -s $DOTFILES_DIR/gitconfig $HOME/.gitconfig

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall