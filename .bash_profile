# Augment environment with user-local installs
export PYTHONPATH=~/local/lib/python2.6:$PYTHONPATH
export PATH=~/local/bin:$PATH:/sbin

# Colorize ls by default
if [ "$TERM" != "dumb" ]; then
    export LS_OPTIONS='--color=auto'
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='0;32'
fi

# OSX-specific settings
if [ "$(uname)" == "Darwin" ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export CLICOLOR=1
fi
