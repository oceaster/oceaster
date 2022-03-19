#   SERVER BASHRC FILE
#      DO NOT EDIT
#   [19/MAR/22 03:55]


# Load up standard site-wide settings.
source /etc/bashrc


#remove duplicate entries from history
export HISTCONTROL=ignoreboth


# Show current git branch in prompt.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
LIGHT_GREEN="\[\033[1;32m\]"
LIGHT_GRAY="\[\033[0;37m\]"
PS1="$LIGHT_GRAY\$(date +%H:%M) \w$YELLOW \$(parse_git_branch)$LIGHT_GREEN\$ $LIGHT_GRAY"


# Load virtualenvwrapper
source virtualenvwrapper.sh &> /dev/null


# System Module Shortcuts
#       Custom tricks & scripts by myself
#       for myself.

# DEVELOPMENT (DEV) SHORTCUTS
alias dev.goto="cd ~/Dev"
alias dev.status="dev.goto && ./Sys/dev/.sh"
alias dev.install="dev.goto && ./Sys/dev/install.sh"
alias dev.checkout="dev.goto && ./Sys/dev/checkout.sh"
alias dev.pull="dev.goto && ./Sys/dev/pull.sh"
alias dev.push="dev.goto && ./Sys/dev/push.sh"
# DEVELOPMENT SYSTEM (SYS) SHORTCUTS
alias sys.setup="~/Easter/Sys/install.sh"
alias sys.display="dev.goto && ./Sys/display.sh"
# DOCKER (DKR) SHORTCUTS
alias docker="dev.goto && ./Sys/docker/.sh"
alias docker.logs="sudo docker logs"
alias docker.stop="dev.goto && ./Sys/docker/stop.sh"
alias docker.reboot="dev.goto && ./Sys/docker/reboot.sh"
alias docker.do="dev.goto && ./Sys/docker/do.sh"
alias docker.asset="dev.goto && ./Sys/docker/asset.sh"
