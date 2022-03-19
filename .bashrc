#    LOCAL BASHRC FILE
#      DO NOT EDIT
#   [19/MAR/22 03:55]


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


# System Module Shortcuts
#       Custom tricks & scripts by myself
#       for myself.

# DEVELOPMENT (DEV) SHORTCUTS
alias dev.goto="cd ~/Dev"
alias dev.open="dev.goto && Sys/dev/.sh"
alias dev.status="dev.goto && Sys/dev/status.sh"
alias dev.checkout="dev.goto && Sys/dev/checkout.sh"
alias dev.pull="dev.goto && Sys/dev/pull.sh"
alias dev.push="dev.goto && Sys/dev/push.sh"
alias dev.uninstall="dev.pull && dev.push && cd ~/ && rm -rf ~/Dev"
alias dev.download="cd ~/ && git clone git@github.com:EasterCompany/Dev.git --recurse-submodules && cd && rm .bashrc && cp ~/Dev/Sys/.bashrc ~/.bashrc && echo '' && echo 'Press [Enter] to exit terminal. Restart Required.' && read && exit"
alias dev.install="dev.goto && Sys/dev/install.sh"
# DEVELOPMENT SYSTEM (SYS) SHORTCUTS
alias sys.setup="~/Dev/Sys/install.sh"
alias sys.display="~/Dev/Sys/display.sh"
# DOCKER (DKR) SHORTCUTS
alias dkr.open="~/Dev/Sys/docker/.sh"
alias dkr.logs="sudo docker logs"
alias dkr.stop="~/Dev/Sys/docker/stop.sh"
alias dkr.reboot="~/Dev/Sys/docker/reboot.sh"
alias dkr.do="~/Dev/Sys/docker/do.sh"
alias dkr.asset="~/Dev/Sys/docker/asset.sh"
