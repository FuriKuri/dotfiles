if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export ZSH=$HOME/.dotfiles/oh-my-zsh
export THEMES_DIR=$HOME/.dotfiles/themes

export ZSH_THEME="furi-honukai"

alias zshconfig="code ~/.zshrc"
HIST_STAMPS="yyyy-mm-dd"
ZSH_CUSTOM=$HOME/.dotfiles/custom

export ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

plugins=(docker kubectl dirpersist git git-extras common-aliases)
source $ZSH/oh-my-zsh.sh

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
export KUBE_PS1_CLUSTER_FUNCTION=cut-10


# kubeclr

source ~/.dotfiles/kube-ps1.sh

# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

[[ -s "~/.dotfiles/grc.zsh" ]] && source ~/.dotfiles/grc.zsh

export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tpack/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tpack/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tpack/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tpack/google-cloud-sdk/completion.zsh.inc'; fi
