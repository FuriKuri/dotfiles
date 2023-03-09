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

export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/theo/Downloads/google-cloud-sdk 2/path.zsh.inc' ]; then . '/Users/theo/Downloads/google-cloud-sdk 2/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/theo/Downloads/google-cloud-sdk 2/completion.zsh.inc' ]; then . '/Users/theo/Downloads/google-cloud-sdk 2/completion.zsh.inc'; fi

[[ ! -f $DOTFILES_DIR/p10k.zsh ]] || source $DOTFILES_DIR/p10k.zsh
