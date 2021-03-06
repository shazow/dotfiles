# Augment environment with user-local installs
if [[ ! "$DOTFILES_LOADED" ]]; then
    export DOTFILES_LOADED=1
    export XDG_BIN_HOME=$HOME/local/bin
    export PATH=$XDG_BIN_HOME:$DOTFILES_PATH/local/bin:/usr/local/bin:$PATH:/sbin:/usr/local/sbin
    export PYTHONPATH=$PYTHONPATH
    export GOPATH=$HOME/local/go
    export VISUAL="vim"
    export EDITOR="vim"
fi

export HISTSIZE=10000
export HISTCONTROL=ignoreboth
shopt -s histappend

# Colorize ls by default
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
fi

# OSX-specific settings
if [ "$(uname)" == "Darwin" ]; then
    export CLICOLOR=1
fi

# Colorize the prompt
if [ "$PS1" ]; then
    host_format="\[\033[01;32m\]"
    user_format="\[\033[01;32m\]"
    path_format="\[\033[01;34m\]"
    input_format="\[\033[00m\]"

    if [ "$SSH_CONNECTION" ]; then
        host_format="\[\033[01;36m\]"
    fi

    case $TERM in
    xterm*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"'
        ;;
    screen)
        PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$H
OME/~}"; echo -ne "\033\\"'
        path_format="\[\033[00;33m\]"
        ;;
    esac

    if [[ ${EUID} == 0 ]] ; then
            PS1="${host_format}\h\${path_format} \W \$${input_format} "
    else
            PS1="${user_format}\u${host_format}@\h${path_format} \w \$${input_format} "
    fi

    shopt -s checkwinsize
fi

# ./local/bin/hub-* settings
export HUB_PATH=$HOME/local/src
