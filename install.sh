#!/bin/bash

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

apps=(
    ag
    cmake
    coreutils
    devcontainer
    git
    git-crypt
    grep
    go
    helm
    httpie
    kind
    jenv
    jq
    just
    mkcert
    minikube
    python
    openjdk@17
    shellcheck
    ssh-copy-id
    macvim
    wget
)

brew install "${apps[@]}"

cask-apps=(
    1password
    firefox
    docker
    google-chrome
    google-drive
    google-cloud-sdk
    keka
    keybase
    keycastr
    intellij-idea-ce
    visual-studio-code
)

brew install "${cask-apps[@]}" --cask


sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm .zshrc
ln -s .dotfiles/zshrc .zshrc

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
rm .p10k.zsh
ln -s .dotfiles/p10k.zsh .p10k.zsh

ln -s .dotfiles/git/gitconfig.local.symlink .gitconfig

ln -s .dotfiles/git/gitignore.symlink .gitignore_global

