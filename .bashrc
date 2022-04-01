# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#    LOCAL BASHRC FILE
#      DO NOT EDIT
#   [19/MAR/22 03:55]


# Remove duplicate entries from history
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
DEV="cd ~/Easter/Dev &&"
DEV_USR="git config user.name"
DEV_EMAIL="git config user.email"
alias DEV="$DEV"
alias dev.goto="cd && $DEV echo && echo ' [DEV] EASTER COMPANY ' && echo && echo '  NAME------' && $DEV_USR && echo '  EMAIL-----' && $DEV_EMAIL && echo"
alias dev.open="DEV Sys/dev/.sh"
alias dev.status="DEV Sys/dev/status.sh"
alias dev.checkout="DEV Sys/dev/checkout.sh"
alias dev.pull="DEV Sys/dev/pull.sh"
alias dev.push="DEV Sys/dev/push.sh"
alias dev.uninstall="dev.pull && dev.push && cd ~/ && rm -rf ~/Dev"
alias dev.download="cd ~/ && git clone git@github.com:EasterCompany/Dev.git --recurse-submodules && cd && rm .bashrc && DEV cp Sys/.bashrc ~/.bashrc && echo '' && echo 'Press [Enter] to exit terminal. Restart Required.' && read && exit"
alias dev.install="DEV Sys/dev/install.sh"
alias dev.update="DEV dev.uninstall && dev.download"
alias dev.clear_db="DEV Sys/dev/clear_db.sh"
# DEVELOPMENT SYSTEM (SYS) SHORTCUTS
alias sys.setup="DEV Sys/install.sh"
alias sys.update="sudo apt update -y && sudo apt upgrade -y && sudo apt autoremove -y"
alias sys.display="DEV Sys/display.sh"
# DOCKER (DKR) SHORTCUTS
alias dkr.open="DEV Sys/docker/.sh"
alias dkr.logs="sudo docker logs"
alias dkr.stop="DEV Sys/docker/stop.sh"
alias dkr.reboot="DEV Sys/docker/reboot.sh"
alias dkr.do="DEV Sys/docker/do.sh"
alias dkr.asset="DEV Sys/docker/asset.sh"

# OVERLORD (O) SHORTCUTS
alias O~="cd ~/Easter/Dev/Ext/Overlord && ./o"
alias o.install="cd ~/Easter/Dev/Ext/Overlord && ./o install"
alias o.install-clients="cd ~/Easter/Dev/Ext/Overlord && ./oinstall -clients"
alias o.build="cd ~/Easter/Dev/Ext/Overlord && ./o build -all"
alias o.run="cd ~/Easter/Dev/Ext/Overlord && ./o build -all && ./o migrate && ./o runserver"
