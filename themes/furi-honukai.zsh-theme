# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Hex Clock
local clock_info='$(hex_clock)'
hex_clock() {
  hours=`printf '%02x' $(date +%H)`
  minutes=`printf '%02x' $(date +%M)`
  seconds=`printf '%02x' $(date +%S)`
  echo "[$hours$minutes$seconds]"
}

# AWS Profile
local aws_info='$(aws_icon)'
function aws_icon {
  if [[ -n $AWS_DEFAULT_PROFILE ]]; then
    echo "%{$fg[white]%} (☁ |%{$fg[yellow]%}$AWS_DEFAULT_PROFILE%{$fg[white]%})"
  fi
}

# Kube Config
local kube_info=' $(kube_ps1)'

# Docker Info
local docker_info='$(prompt_docker_host)'
prompt_docker_host() {
  if [[ -n $DOCKER_HOST ]]; then
    echo " %{$fg[white]%}(🐳 |%{$fg[blue]%}$DOCKER_HOST%{$fg[white]%})"
  fi
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# VCS
YS_VCS_PROMPT_PREFIX1="%{$reset_color%}"
YS_VCS_PROMPT_PREFIX2="%{$fg[cyan]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[red]%}✖︎"
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%}●"

# Git info.
local git_info=' $(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="(🐙 |${YS_VCS_PROMPT_PREFIX1}${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX) "
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# Prompt format: \n # USER at MACHINE in DIRECTORY on git:BRANCH STATE [TIME] \n $
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$fg[cyan]%}%n\
%{$fg[white]%} \
%{$fg[green]%}$(box_name) \
%{$fg[white]%}\
%{$terminfo[bold]$fg[magenta]%}${current_dir}%{$reset_color%}\
${docker_info}\
${kube_info}\
${aws_info}\
${git_info}\
%{$fg[white]%}${clock_info}
%{$terminfo[bold]$fg[red]%}→ %{$reset_color%}"

if [[ "$USER" == "root" ]]; then
PROMPT="
%{$terminfo[bold]$fg[blue]%}#%{$reset_color%} \
%{$bg[yellow]%}%{$fg[cyan]%}%n%{$reset_color%} \
%{$fg[white]%} \
%{$fg[green]%}$(box_name)\
%{$fg[white]%}\
%{$terminfo[bold]$fg[magenta]%}${current_dir}%{$reset_color%}\
${git_info}\
%{$fg[white]%}[%*]
%{$terminfo[bold]$fg[red]%}→ %{$reset_color%}"
fi
