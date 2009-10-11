# /etc/skel/.bashrc

if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

if [ -f ~/.bash_private ]; then
    # Load private functions and variables not fit for public consumption
    source ~/.bash_private
fi

# Augment environment with user-local installs
export PYTHONPATH=~/local/lib/python2.6:$PYTHONPATH
export PATH=~/local/bin:$PATH

# Colorize ls by default
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;32'
fi
 



# Gentoo-specific helpers

alias listmodules="find /lib/modules/*/ -type f -iname '*.o' -or -iname '*.ko'"



# Helper functions

alias ,="ls -lAGh"
alias ..="cd .."
alias -- -="cd -"

function c () { # Substitute for `cd`
    cd "${*}"
    pwd
    ls
}

function f () { # Find file in cwd
    find . -name "*${*}*"
}

function fcd() { # Find directory under cwd and cd into it
    TARGET=$(find . -name "*${*}*" -type d | head -n1)
    if [ $TARGET ]; then
        cd $TARGET
    else
        echo "Directory not found: ${*}"; return
    fi
}

function p () { # Find process
    ps aux | grep "${*}"
}

function g () { # Grep in cwd
    grep -Ir "$(echo $*)" .
}

function gg () { # Double-grep (grep with files resulting of the first grep)
    grep -Irl ${1} . | xargs grep -I ${2}
}

function bak() { # Move target to *.bak
    mv -v $1{,.bak}
}

function unbak() { # Revert previously bak'd target
    if [ "${1:0-4}" = ".bak" ]; then
        mv -v ${1} ${1::3}
    else
        echo "No .bak extension, ignoring: $1"
    fi
}
