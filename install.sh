#!/bin/bash

mv $HOME/.zshrc .zshrc_backup
ln -s $HOME/.dotfiles/zshrc $HOME/.zshrc
