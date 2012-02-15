# Navigation
alias ,="ls -lAGh"
alias ..="cd .."
alias -- -="cd -"

alias lsdir='find . -type d -depth 1'
alias cdrandom='cd "$(lsdir | randomline $(lsdir | wc -l))"'

# Application shortcuts
if [ "$(uname)" == "Darwin" ]; then 
	alias v="open -a MacVim --"
else
	alias v="gvim"
  alias vv="gvim --remote-silent"
fi

# Gentoo-specific helpers
alias listmodules="find /lib/modules/*/ -type f -iname '*.o' -or -iname '*.ko'"
