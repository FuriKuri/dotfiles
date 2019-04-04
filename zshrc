export ZSH=$HOME/.dotfiles/oh-my-zsh
export THEMES_DIR=$HOME/.dotfiles/themes

export ZSH_THEME="furi-honukai"
# export ZSH_THEME="spaceship"

alias zshconfig="code ~/.zshrc"
HIST_STAMPS="yyyy-mm-dd"
ZSH_CUSTOM=$HOME/.dotfiles/custom

export ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

plugins=(docker kubectl dirpersist git git-extras go common-aliases zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.dotfiles/{exports.common,aliases.common,functions.common}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
    for file in ~/.dotfiles/{exports.mac,aliases.mac,functions.mac}; do
		[ -r "$file" ] && [ -f "$file" ] && source "$file"
	done
else
    # Unknown.
fi

unset file

kubeclr

source ~/.dotfiles/kube-ps1.sh

# export NVM_DIR="$HOME/.nvm"
# source $(brew --prefix nvm)/nvm.sh
# alias loadnvm=". $(brew --prefix nvm)/nvm.sh"

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# eval "$(rbenv init -)"
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

[[ -s "~/.dotfiles/grc.zsh" ]] && source ~/.dotfiles/grc.zsh

export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tpack/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tpack/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tpack/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tpack/google-cloud-sdk/completion.zsh.inc'; fi
