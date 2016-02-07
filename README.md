# shazow's dotfiles

Welcome to my dotfiles, a life-long project of improving my computing 
environment.

Please help yourself to the many person-years of experience it took to compile 
and tweak these tender, juicy, and yet lean, configurations.

Below is a sampling of what to expect:


## $ source helpers.bash

(Alternate title: *Bash for Ballers & Debutante Bashellites*)

Do you use a Bash shell every day, all day? Here is a selection of some handy
tiny helpers to help you love life a little bit more.

`f $1`: **Find file named like $1 in the cwd**

```bash
f() {
    find . -name "*$**"

```

Example:

```shell
$ f help
./helpers.bash
```

`fcd $1`: **Find directory named like $1 under cwd and cd into it**

```bash
fcd() {
    target=$(find . -name "*$**" -type d | head -n1)
    if [[ "$target" ]]; then
        cd "$target"
    else
        echo "Directory not found: $*"; return
    fi
}
```

Example:

```shell
dotfiles $ fcd bin
dotfiles/local/bin $
```


`p $1`: **Find a running process named like $1**

```bash
p() {
    ps aux | grep "$*"
}
```

Example:

```shell
$ p iterm
shazow            540   5.7  2.1  ... 23:03.17 /opt/homebrew-cask/Caskroom/iterm2-beta/1.0.0.20140629/iTerm.app/Contents/MacOS/iTerm
```


`g $1`: **Grep in cwd**

```bash
g() {
    grep --exclude-dir='*/\.*' -Ir "$(echo $*)" .
}
```

Example:

```shell
$ g "cwd and cd"
./helpers.bash:# Find directory named like $1 under cwd and cd into it
```


`gg $1 $2`: **Double-grep: grep with files resulting of the first grep**

```bash
gg() {
    grep --exclude-dir='*/\.*' -Irl "${1}" . | xargs grep -I "${2}"
}
```

Example: Find all source-ing in files that mention helpers.bash

```shell
$ gg "helpers.bash" "source"
./.bashrc:    source $DOTFILES_PATH/.bash_profile
...
```


`greplace $1 $2`: **Grep in cwd and replace $1 with $2 in-line.**

```bash
greplace() {
    grep --exclude-dir='*/\.*' -Irl "$1" . | while read i; do
        echo "Replacing: $i"
        perl -p -i -e "s/$1/$2/g" "$i"
    done
}
```

Example:

```shell
$ greplace "fcd" "findcd"
Replacing: ./helpers.bash
```


`ingrep $1 $2`: **Grep in files named like $1 for subpattern $2**

```bash
ingrep() {
    find . -name "*${1}*" -exec grep -I "${2}" {} +
}
```

Example:

```shell
$ ingrep bash randomline
./.bash_aliases:alias cdrandom='cd "$(lsdir | randomline $(lsdir | wc -l))"'
./helpers.bash:randomline() {
```
