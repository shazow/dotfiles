# Augment environment with user-local installs
export PYTHONPATH=~/local/lib/python2.6
export PATH=~/local/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin

# Colorize ls by default
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;32'
fi
