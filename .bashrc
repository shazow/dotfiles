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
    if [ "$target" ]; then
        cd "$target"
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
        perl -p -i -e "s/$1/$2/g" "$i"
    done
}

function random () { # Print a random number between two input values. (Default 1,n or 0,1)
    a="$1"
    b="$2"
    if [ ! "$a" ]; then
        a="0";
        b="1";
    elif [ ! "$b" ]; then
        b="$a";
        a="1";
    fi
    range="$[ $b - $a + 1]";
    echo "$[ ( $RANDOM % $range ) + $a ]";
}

function randomline () { # Given a number of lines, read from stdin and echo a random one.
    if [ ! "$1" ]; then
        echo "Must specify how many lines to consider."
        return 1
    fi
    count="$(random 1 $1)";
    while read line; do
        if [ "$count" == "1" ]; then
            echo "$line";
            break;
        fi
        count="$[ $count - 1 ]";
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

if [ ! which say &> /dev/null ]; then
    function say() { echo "$*" | festival --tts; }
fi

function vmod() { # Open modified git files usin `v`
    v $(git status | grep 'modified:' | cut -d ' ' -f4 | xargs);
}

function w() { watch -dn1 $*; }


# Workspace navigation functions

PROJECTS_DIR=~/projects
ENV_DIR=~/env

function go() { # Jump to a project (and activate environment)
    to=$1
    if [ ! "$to" ]; then
        # Go to the last go'ne destination
        to=$(grep "^go " ~/.bash_history | tail -n1 | cut -d ' ' -f2-)
    fi

    cd $PROJECTS_DIR/$to

    # Load project profile (e.g. virtualenv)
    [ -e .profile ] && . .profile
}

function _complete_go() { # Autocomplete function for go
    COMPREPLY=( $(compgen -W "$(ls $PROJECTS_DIR/)" -- "${COMP_WORDS[$COMP_CWORD]}") )
}
complete -F _complete_go go

function create_virtualenv() { # Make a fresh virtualenv [for some existing directory [with a give environment name]]
    if [ "$VIRTUAL_ENV" ]; then
        deactivate
    fi
    if [ "$1" ]; then
        name="$(basename $1)"
        path=$1
    else
        name="$(basename $PWD)"
        path="$PWD"
    fi
    if [ "$2" ]; then
        name="$2"
    fi
    if [ "$1" == "." ]; then
        env_path=".env"
    else
        env_path="$ENV_DIR/$name"
    fi
    if [ -d "$env_path" ]; then
        echo "$env_path already exists. Activating and aborting."
        source "$env_path/bin/activate"
        return 1;
    fi
    virtualenv "$env_path" -p $(which python)
    ln -s "$env_path/bin/activate" "$path/.profile"
    source "$env_path/bin/activate"
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
