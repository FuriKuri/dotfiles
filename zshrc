if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export ZSH_DISABLE_COMPFIX=true

export ZSH=$HOME/.dotfiles/oh-my-zsh
export THEMES_DIR=$HOME/.dotfiles/themes

export ZSH_THEME="furi-honukai"

HIST_STAMPS="yyyy-mm-dd"
ZSH_CUSTOM=$HOME/.dotfiles/custom

export ZSH_COMPDUMP="${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

plugins=(docker kubectl dirpersist git git-extras common-aliases)
source $ZSH/oh-my-zsh.sh

for file in ~/{.extra}; do
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tpack/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/tpack/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tpack/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/tpack/google-cloud-sdk/completion.zsh.inc'; fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/tpack/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/tpack/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/tpack/opt/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/tpack/opt/anaconda3/bin:$PATH"
 #   fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

