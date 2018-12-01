export ZSH=$HOME/.dotfiles/oh-my-zsh
export THEMES_DIR=$HOME/.dotfiles/themes

export ZSH_THEME="furi-honukai"

alias zshconfig="code ~/.zshrc"
HIST_STAMPS="yyyy-mm-ddy"
ZSH_CUSTOM=$HOME/.dotfiles/custom

plugins=(docker kubectl dirpersist git git-extras go common-aliases z zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{exports,aliases.common,aliases,functions.common,functions,extra,echo,tabtab,path,ubuntu}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

source ~/.dotfiles/kube-ps1.sh

export NVM_DIR="$HOME/.nvm"
# source $(brew --prefix nvm)/nvm.sh
alias loadnvm=". $(brew --prefix nvm)/nvm.sh"

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# eval "$(rbenv init -)"
rbenv() {
  eval "$(command rbenv init -)"
  rbenv "$@"
}

# source "`brew --prefix grc`/etc/grc.bashrc"
. /usr/local/etc/grc.bashrc

export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tpack/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tpack/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tpack/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tpack/google-cloud-sdk/completion.zsh.inc'; fi
