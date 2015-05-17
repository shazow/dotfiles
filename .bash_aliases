# Navigation
alias ,="ls -lAGh"
alias ..="cd .."
alias -- -="cd -"

alias lsdir='find . -type d -depth 1'
alias cdrandom='cd "$(lsdir | randomline $(lsdir | wc -l))"'

# Gentoo-specific helpers
alias listmodules="find /lib/modules/*/ -type f -iname '*.o' -or -iname '*.ko'"
