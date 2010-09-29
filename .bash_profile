# Augment environment with user-local installs
export PATH=~/local/bin:$PATH:/sbin
export HISTSIZE=10000

# Colorize ls by default
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;32'
fi
