if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

DOTFILES_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

export ZSH_DISABLE_COMPFIX=true

export ZSH=$HOME/$DOTFILES_DIR/oh-my-zsh
export THEMES_DIR=$HOME/$DOTFILES_DIR/themes

export ZSH_THEME="furi-honukai"

HIST_STAMPS="yyyy-mm-dd"
ZSH_CUSTOM=$HOME/$DOTFILES_DIR/custom

export ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

plugins=(docker kubectl dirpersist git git-extras common-aliases)
source $ZSH/oh-my-zsh.sh

for file in ~/{.extra,.export}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
for file in ~/.dotfiles/{exports.common,aliases.common,functions.common}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # ...
elif [[ "$OSTYPE" == "darwin"* ]]; then
    for file in ~/.dotfiles/{exports.mac,aliases.mac,functions.mac}; do
		[ -r "$file" ] && [ -f "$file" ] && source "$file"
	done
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
    # jenv global 11
else
    # Unknown.
fi

unset file

export KUBE_PS1_CLUSTER_FUNCTION=cut-10
source ~/.dotfiles/kube-ps1.sh

source ~/.dotfiles/notion.sh

[[ -s "~/.dotfiles/grc.zsh" ]] && source ~/.dotfiles/grc.zsh

# Add ... to the `$PATH`
export PATH="$HOME/bin:$PATH"
export GOPATH="$HOME/go"
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi

