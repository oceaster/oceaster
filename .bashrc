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
DEV="cd ~/Dev &&"
alias DEV="$DEV"
alias dev.goto="cd $DEV"
alias dev.open="DEV Sys/dev/.sh"
alias dev.status="DEV Sys/dev/status.sh"
alias dev.checkout="DEV Sys/dev/checkout.sh"
alias dev.pull="DEV Sys/dev/pull.sh"
alias dev.push="DEV Sys/dev/push.sh"
alias dev.uninstall="dev.pull && dev.push && cd ~/ && rm -rf ~/Dev"
alias dev.download="DEV git clone git@github.com:EasterCompany/Dev.git --recurse-submodules && cd && rm .bashrc && cp DEV Sys/.bashrc ~/.bashrc && echo '' && echo 'Press [Enter] to exit terminal. Restart Required.' && read && exit"
alias dev.install="DEV Sys/dev/install.sh"
# DEVELOPMENT SYSTEM (SYS) SHORTCUTS
alias sys.setup="DEV Sys/install.sh"
alias sys.display="DEV Sys/display.sh"
# DOCKER (DKR) SHORTCUTS
alias dkr.open="DEV Sys/docker/.sh"
alias dkr.logs="sudo docker logs"
alias dkr.stop="DEV Sys/docker/stop.sh"
alias dkr.reboot="DEV Sys/docker/reboot.sh"
alias dkr.do="DEV Sys/docker/do.sh"
alias dkr.asset="DEV Sys/docker/asset.sh"
