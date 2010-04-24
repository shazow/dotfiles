# Augment environment with user-local installs
export PYTHONPATH=~/local/lib/python2.6:$PYTHONPATH
export PATH=~/local/bin:$PATH:/sbin

HISTCONTROL=ignoreboth
shopt -s histappend

# Colorize ls by default
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='0;32'
fi

# OSX-specific settings
if [ "$(uname)" == "Darwin" ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export CLICOLOR=1
fi

# Colorize the prompt
if [ "$PS1" ]; then
    case $TERM in
    xterm*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
        ;;
    screen)
        PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$H
OME/~}"; echo -ne "\033\\"'
        ;;
    esac
    shopt -s checkwinsize
    [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
fi
