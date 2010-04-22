#!/bin/bash

# Get the absolute path of the dotfiles
oldpath=$PWD
cd $(dirname $0)
path=$PWD
cd $OLDPATH

function include_into() {
	if test -e $2 && $(grep -q ". $1" $2);  then
		echo "Already sourced, skipping: $1 -> $2";
		return 1;
	fi

	echo "Adding source: $1 -> $2";
	echo ". $1" >> $2
}

# Link files
if [ "$(uname)" == "Darwin" ]; then
	include_into "$path/.bash_profile" ~/.profile
	include_into "$path/.bashrc" ~/.profile
else
	include_into "$path/.bash_profile" ~/.bash_profile
	include_into "$path/.bashrc" ~/.bashrc
fi

include_into "$path/.bash_aliases" ~/.bash_aliases
