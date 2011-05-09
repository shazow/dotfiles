#!/bin/bash

# Get the absolute path of the dotfiles
oldpath="$PWD"
cd $(dirname "$0")
path="$PWD"
cd "$OLDPATH"

no_all=false
if [ "$1" == "-n" ]; then
    no_all=true
fi

function append_into() {
    if test -e "$2" && $(grep -q "$1" "$2");  then
        echo "Already sourced, skipping: $1 -> $2"
        return 1
    fi

    echo "Adding source: $1 -> $2"
    echo "$1" >> "$2"
}

function copy() {
    if test -e "$2"; then
        if $no_all; then
            echo "Skipping: $2"
            return
        fi
        read -n1 -p "Target '$2' already exists, overwrite? [y/N] " r
        if [ "$r" != "" ]; then
            echo ""
        fi
        if [ "$r" != "y" ]; then
            return
        fi
    fi;
    echo "Copying: $1 -> $2"
    cp -r "$1" "$2"
}

append_into "export DOTFILES_PATH=$path" ~/.bash_profile
append_into ". $path/.bash_aliases" ~/.bash_aliases
append_into ". $path/.bash_profile" ~/.bash_profile
append_into ". $path/.bashrc" ~/.bashrc
append_into '. $DOTFILES_PATH/.vimrc' ~/.vimrc

copy "$path/local" ~/local

copy "$path/.gitconfig" ~/.gitconfig
copy "$path/.screenrc" ~/.screenrc

mkdir -p ~/.vim/{backup,tmp}

if [ "$(uname)" == "Darwin" ]; then
    append_into ". ~/.bash_profile" ~/.profile
    append_into ". ~/.bashrc" ~/.bash_profile
fi
