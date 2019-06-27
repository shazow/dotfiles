# Load auxiliary configurations
declare load_files=(~/.bash_private ~/.bash_aliases)

for f in ${load_files[@]}; do
    if [[ -f $f ]]; then
        source $f
    fi
done

if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

source $DOTFILES_PATH/helpers.bash
