# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

source $ZSH/oh-my-zsh.sh

DOTFILES_DIR=$HOME/.dotfiles

for file in ~/{.extra,.project}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
for file in $DOTFILES_DIR/{exports,aliases,functions}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"
export PATH="$JAVA_HOME/bin:$PATH"

[[ ! -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ]] || source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"

[[ ! -f $DOTFILES_DIR/p10k.zsh ]] || source $DOTFILES_DIR/p10k.zsh
