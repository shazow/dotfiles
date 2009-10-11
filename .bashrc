if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

# Load auxiliary configurations
LOAD_FILES="~/.bash_private ~/.bash_aliases"

for F in $LOAD_FILES; do
    if [ -f $F ]; then
        source $F
    fi
done

# Gentoo-specific helpers

alias listmodules="find /lib/modules/*/ -type f -iname '*.o' -or -iname '*.ko'"



# Helper functions

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
    T=$1;
    if [ "${T:0-1}" = "/" ]; then
        T=${T%%/}; # Strip trailing / of directories
    fi
    mv -v $T{,.bak}
}

function unbak() { # Revert previously bak'd target
    T=$1;
    if [ "${T:0-1}" = "/" ]; then
        T=${T%%/}; # Strip trailing / of directories
    fi

    if [ "${T:0-4}" = ".bak" ]; then
        mv -v ${T} ${T%%.bak}
    else
        echo "No .bak extension, ignoring: $T"
    fi
}
