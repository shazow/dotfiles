# Navigation
alias ,="ls -lAGh"
alias ..="cd .."
alias -- -="cd -"

# Application shortcuts
if [ "$(uname)" == "Darwin" ]; then 
	alias v="open -a MacVim"
else
	alias v="gvim"
fi

# Gentoo-specific helpers
alias listmodules="find /lib/modules/*/ -type f -iname '*.o' -or -iname '*.ko'"

