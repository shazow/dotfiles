if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

if [ "$TERM" == "screen" ]; then
    # Screen doesn't load .bash_profile?
    . $DOTFILES_PATH/.bash_profile
fi

# Load auxiliary configurations
load_files=(~/.bash_private ~/.bash_aliases)

for f in ${load_files[@]}; do
    if [ -f $f ]; then
        source $f
    fi
done


# Helper functions

function c () { # Substitute for `cd`
    cd *${*}*
    pwd
    ls
}

function f () { # Find file in cwd
    find . -name "*$**"
}

function fcd() { # Find directory under cwd and cd into it
    target=$(find . -name "*$**" -type d | head -n1)
    if [ $target ]; then
        cd $target
    else
        echo "Directory not found: $*"; return
    fi
}

function p () { # Find process
    ps aux | grep "$*"
}

function g () { # Grep in cwd
    grep -Ir "$(echo $*)" .
}

function gg () { # Double-grep (grep with files resulting of the first grep)
    grep -Irl ${1} . | xargs grep -I ${2}
}

function greplace () { # Grep in cwd and replace $1 with $2 in-line
    grep -Irl "$1" . | while read i; do
        echo "Replacing: $i"
        /usr/bin/perl -p -i -e "s/$1/$2/g" "$i"
    done
}

function mailfile() { # Send file to a given email address as attachment
    # uuenview can be replaced with uuencode (bin depends on the distro)
    uuenview "$1" | mail -s "$(basename $1)" $2
}

function bak() { # Move target to *.bak
    t=$1;
    if [ "${t:0-1}" = "/" ]; then
        t=${t%%/}; # Strip trailing / of directories
    fi
    mv -v $t{,.bak}
}

function unbak() { # Revert previously bak'd target
    t=$1;
    if [ "${t:0-1}" = "/" ]; then
        t="${t%%/}"; # Strip trailing / of directories
    fi

    if [ "${t:0-4}" = ".bak" ]; then
        mv -v "$t" "${t%%.bak}"
    else
        echo "No .bak extension, ignoring: $t"
    fi
}

function say() { echo "$*" | festival --tts; }

function w() { watch -dn1 $*; }


# Workspace navigation functions

function go() { # Jump to a project (and activate environment)
    to=$1
    if [ ! "$to" ]; then
        # Go to the last go'ne destination
        to=$(grep "^go " ~/.bash_history | tail -n1 | cut -d ' ' -f2-)
    fi

    cd ~/projects/$to

    # Load project profile (e.g. virtualenv)
    [ -e .profile ] && . .profile
}

function up() { # cd to root of repository
    old_pwd="$PWD";
    while [ 1 ]; do
        cd ..
        if [ "$PWD" == "/" ]; then
            cd "$old_pwd"
            echo "No repository found, returned to $PWD"
            return 1
        fi
        for repo in ".git" ".hg"; do
            if [ -d "$repo" ]; then
                echo "Found $repo at $PWD"
                return 0;
            fi
        done
    done
}
