# Collection of useful helpers for day-to-day bash shell'ing.
# Make sure to `source` your helpers rather than executing the bash file.

# Substitute for `cd`
c() {
    cd *${*}*
    pwd
    ls
}

# Find file named like $1 in the cwd
# Example:
#   $ f help
#   ./helpers.bash
f() {
    find . -name "*$**"
}

# Find directory named like $1 under cwd and cd into it
# Example:
#   dotfiles $ fcd bin
#   dotfiles/local/bin $
fcd() {
    local target="$(find . -name "*${*}*" -type d | head -n1)"
    if [[ "$target" ]]; then
        cd "$target"
    else
        echo "Directory not found: $*"; return
    fi
}

# Find a source dir using findsrc and cd into it
scd() {
    local target="$(findsrc "${*}" | head -n1)"
    if [[ "$target" ]]; then
        cd "$target"
    else
        echo "Directory not found: $*"; return
    fi
}

# Autocomplete function for scd
_complete_scd() {
    local cur=${COMP_WORDS[COMP_CWORD]}
    local srcpaths

    if [[ -z "$SOURCE_DIRS" ]]; then
        return 0
    fi

    local OLD_IFS="$IFS"
    IFS=":" srcpaths=( $SOURCE_DIRS )
    IFS="$OLD_IFS"

    # Use fd to find all directories up to depth 3, extract basenames, and filter with compgen
    local targets
    targets=$(fd -d3 -td . "${srcpaths[@]}" --color=never | xargs -n1 basename)

    COMPREPLY=( $(compgen -W "$targets" -- "$cur") )
}
complete -F _complete_scd scd

# Find a running process named like $1
# Example:
#   $ p iterm
#   shazow            540   5.7  2.1  ... 23:03.17 /opt/homebrew-cask/Caskroom/iterm2-beta/1.0.0.20140629/iTerm.app/Contents/MacOS/iTerm
p() {
    ps aux | grep "$*"
}

# Grep in cwd
# Example:
#   $ g "cwd and cd"
#   ./helpers.bash:# Find directory named like $1 under cwd and cd into it
g() {
    grep --exclude-dir='*/\.*' -Ir "$(echo $*)" .
}

# Double-grep: grep with files resulting of the first grep
# Example: Find all source-ing in files that mention helpers.bash
#   $ gg "helpers.bash" "source"
#   ./.bashrc:    source $DOTFILES_PATH/.bash_profile
#   ...
gg() {
    grep --exclude-dir='*/\.*' -Irl "${1}" . | xargs grep -I "${2}"
}

# Grep in cwd and replace $1 with $2 in-line. (Uses regexp, remember to escape when necessary.)
# Example:
#   $ greplace "fcd" "findcd"
#   Replacing: ./helpers.bash
greplace() {
    grep --exclude-dir='*/\.*' -Irl "$1" . | while read i; do
        echo "Replacing: $i"
        perl -p -i -e "s/$1/$2/g" "$i"
    done
}

# Grep in files named like $1 for subpattern $2
# Example:
#   $ ingrep bash randomline
#   ./.bash_aliases:alias cdrandom='cd "$(lsdir | randomline $(lsdir | wc -l))"'
#   ./helpers.bash:randomline() {
ingrep() {
    find . -name "*${1}*" -exec grep -I "${2}" {} +
}

# Print a random number between two input values. (Default 1,n or 0,1)
random() {
    declare a="$1" b="$2"
    if [[ ! "$a" ]]; then
        a="0";
        b="1";
    elif [[ ! "$b" ]]; then
        b="$a";
        a="1";
    fi
    local range="$[ $b - $a + 1]";
    echo "$[ ( $RANDOM % $range ) + $a ]";
}

# Given a number of lines, read from stdin and echo a random one.
randomline() {
    if [[ ! "$1" ]]; then
        echo "Must specify how many lines to consider."
        return 1
    fi
    local count="$(random 1 $1)";
    while read line; do
        if [[ "$count" == "1" ]]; then
            echo "$line";
            break;
        fi
        count="$[ $count - 1 ]"
    done
}

# Send file to a given email address as attachment
mailfile() {
    # uuenview can be replaced with uuencode (bin depends on the distro)
    uuenview "$1" | mail -s "$(basename $1)" $2
}

# Move target $1 to $1.bak
# Example:
#   $ bak helpers.bash
#   helpers.bash -> helpers.bash.bak
bak() {
    declare target=$1;
    if [[ "${target:0-1}" = "/" ]]; then
        target=${target%%/}; # Strip trailing / of directories
    fi
    mv -v $target{,.bak}
}

# Revert previously bak'd $1 target
# Example:
#   $ unbak *.bak
#   helpers.bash.bak -> helpers.bash
unbak() {
    declare target=$1;
    if [[ "${target:0-1}" = "/" ]]; then
        # Strip trailing / of directories
        target="${target%%/}"
    fi

    if [[ "${target:0-4}" = ".bak" ]]; then
        mv -v "$target" "${target%%.bak}"
    else
        echo "No .bak extension, ignoring: $target"
    fi
}

if ! (which say &> /dev/null) then
    function say() { echo "$*" | festival --tts; }
fi

# Open modified git files usin `v`
vmod() {
    v $(git status | grep 'modified:' | cut -d ' ' -f4 | xargs)
}

# Watch a command for diffs every second
w() {
    watch -dn1 $*
}


# Workspace navigation functions

if [[ -z "$PROJECTS_DIR" ]]; then
    PROJECTS_DIR="$HOME/projects"
fi

if [[ -z "$SOURCE_DIRS" ]]; then
    SOURCE_DIRS="$PROJECTS_DIR"
fi

BIN_GO="$(which go 2> /dev/null)"

# Jump to a project (and activate environment)
go() {
    declare to=$1
    if [[ ! "$to" ]]; then
        # Go to the last go'ne destination
        to=$(grep "^go " ~/.bash_history | tail -n1 | cut -d ' ' -f2-)
    fi

    target=$PROJECTS_DIR/$to
    if [[ -d $target ]]; then
        cd "$target"

        # Load project profile (e.g. virtualenv)
        [[ -e .profile ]] && . .profile
    elif [[ "$BIN_GO" ]]; then
        $(which go) "$@"
        return
    fi
}

# Autocomplete function for go
_complete_go() {
    COMPREPLY=( $(compgen -W "$(ls $PROJECTS_DIR/)" -- "${COMP_WORDS[$COMP_CWORD]}") )
}
complete -F _complete_go go

exitenv() {
    export PS1="${PS1##(*) }"
}

# Add $1 to $PS1
enterenv() {
    exitenv
    export PS1="($1) $PS1"
}

# Make a fresh virtualenv [for some existing directory [with a give environment name]]
create_virtualenv() {
    if [[ "$VIRTUAL_ENV" ]]; then
        deactivate
    fi
    if [[ "$1" ]]; then
        name="$(basename $1)"
        path=$1
    else
        name="$(basename $PWD)"
        path="$PWD"
    fi
    if [[ "$2" ]]; then
        name="$2"
    fi
    if [[ "$1" == "." ]]; then
        env_path=".env"
        name="$(basename $PWD)"
    else
        env_path="$path/.env"
    fi
    if [[ -d "$env_path" ]]; then
        echo "$env_path already exists. Activating and aborting."
        source "$env_path/bin/activate"
        return 1
    fi
    virtualenv "$env_path" -p "$(which python)" --prompt="($name)"
    ln -s "$env_path/bin/activate" "$path/.profile"
    source "$env_path/bin/activate"
}

# Traverse shallow depth of SOURCE_DIRS and find the first match
findsrc() {
    declare query="$1" srcpaths=""
    if [[ -z "$SOURCE_DIRS" ]]; then
        echo "\$SOURCE_DIRS is empty."
        return 1
    fi
    local OLD_IFS="$IFS"
    IFS=":" srcpaths=( $SOURCE_DIRS )
    IFS="$OLD_IFS"
    if [[ ! "$srcpaths" ]]; then
        # Single element
        srcpaths=( "$SOURCE_DIRS" )
    fi
    # TODO: Backport to `find`?
    fd -d3 -td "$query" ${srcpaths[@]}
}

# cd to root of the current repository
# Example:
#   dotfiles/local/bin $ up
#   Found .git at .../dotfiles
#   dotfiles $
up() {
    local old_pwd="$PWD"
    while [[ 1 ]]; do
        cd ..
        if [[ "$PWD" == "/" ]]; then
            cd "$old_pwd"
            echo "No repository found, returned to $PWD"
            return 1
        fi
        for repo in ".git" ".hg"; do
            if [[ -d "$repo" ]]; then
                echo "Found $repo at $PWD"
                return 0
            fi
        done
    done
}

# find the nearest parent $1*.nix file and nix-shell into it, without changing
# directories.
upshell() {
    declare pattern="${1}*.nix"
    local cwd=${PWD%/}
    while [[ -d $cwd ]]; do
        local candidate="$(compgen -G "${cwd}/${pattern}" | head -n1)"
        if [[ -f "${candidate}" ]]; then
            echo "Found nix-shell, entering: ${candidate}"
            nix-shell "${candidate}"
            return 0
        fi
        cwd=${cwd%/*}
    done
    echo "No nix-shell: ${1}*.nix"
    return 1
}

# http://www.foo.com/bar -> foo.com
domain() {
    local parts=(${1//\// });
    local domain="${parts[1]}"

    if [[ ! "$domain" ]] || [[ "$domain" != *.* ]]; then
        domain="${parts[0]}"
    fi

    echo "${domain/www./}"
}

# whois, but a bit smarter (parse domains out of urls)
whois() {
    $(which whois) "$(domain $1)"
    return $?
}

# dig wrapper for returning all records
dns() {
    dig +nocmd "$(domain $1)" any +multiline +noall +answer
}
