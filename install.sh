#!/bin/bash

cd $HOME/.dotfiles
git submodule update --init --recursive
cd $HOME

mv $HOME/.zshrc .zshrc_backup
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -s $HOME/.dotfiles/vimrc $HOME/.vimrc
ln -s $HOME/.dotfiles/gitconfig $HOME/.gitconfig

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall