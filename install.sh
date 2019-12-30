#!/bin/bash

cd $HOME/.dotfiles
git submodule update --init --recursive
cd $HOME

mv $HOME/.zshrc .zshrc_backup
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
