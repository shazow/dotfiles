# shazow's dotfiles

Welcome to my dotfiles, a life-long project of improving my computing 
environment.

Please help yourself to the many person-years of experience it took to compile 
and tweak these tender, juicy, and yet lean, configurations.

Below is a sampling of what to expect:


## $ source helpers.bash

(Alternate title: *Bash for Ballers & Debutante Bashellites*)

Do you use a Bash shell every day, all day? Here is a selection of some handy
tiny helpers to help you love life a little bit more. I invite you to adopt them 
into your own dotfiles home and nourish them.

First, a quick table of contents:

* Searching, Replacing, Navigating
  * `f` Find file named like $1 in the cwd
  * `fcd` Find directory named like $1 under cwd and cd into it
  * `p` Find a running process named like $1
  * `g` Grep in cwd
  * `gg` Double-grep: grep with files resulting of the first grep
  * `greplace` Grep in cwd and replace $1 with $2 in-line.
  * `ingrep` Grep in files named like $1 for subpattern $2
  * `up` cd to root of the current repository (must have!)
* Other utilities
  * `domain` Extract domains from URLs
  * `whois` A smarter drop-in replacement for `whois`
  * `dns` Look up DNS entries for a URL
  * `bak` Move target $1 to $1.bak
  * `unbak` Revert previously bak'd $1 target
  * `w` Watch a command for diffs every second


### Searching, Replacing, Navigating


#### Find file named like $1 in the cwd

```bash
f() {
    find . -name "*$**"
}
```

```
$ f help
./helpers.bash
```

#### Find directory named like $1 under cwd and cd into it

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

```
dotfiles $ fcd bin
dotfiles/local/bin $
```


#### Find a running process named like $1

```bash
p() {
    ps aux | grep "$*"
}
```

```
$ p iterm
shazow            540   5.7  2.1  ... 23:03.17 /opt/homebrew-cask/Caskroom/iterm2-beta/1.0.0.20140629/iTerm.app/Contents/MacOS/iTerm
```


#### Grep in cwd

```bash
g() {
    grep --exclude-dir='*/\.*' -Ir "$(echo $*)" .
}
```

```
$ g "cwd and cd"
./helpers.bash:# Find directory named like $1 under cwd and cd into it
```


#### Double-grep: grep with files resulting of the first grep

```bash
gg() {
    grep --exclude-dir='*/\.*' -Irl "${1}" . | xargs grep -I "${2}"
}
```

```
$ # Let's find all `source`-ing in files that mention `helpers.bash`
$ gg "helpers.bash" "source"
./.bashrc:    source $DOTFILES_PATH/.bash_profile
...
```


#### Grep in cwd and replace $1 with $2 in-line.

```bash
greplace() {
    grep --exclude-dir='*/\.*' -Irl "$1" . | while read i; do
        echo "Replacing: $i"
        perl -p -i -e "s/$1/$2/g" "$i"
    done
}
```

```
$ greplace "fcd" "findcd"
Replacing: ./helpers.bash
```


#### Grep in files named like $1 for subpattern $2

```bash
ingrep() {
    find . -name "*${1}*" -exec grep -I "${2}" {} +
}
```

```
$ ingrep bash randomline
./.bash_aliases:alias cdrandom='cd "$(lsdir | randomline $(lsdir | wc -l))"'
./helpers.bash:randomline() {
```


#### cd to root of the current repository

```bash
up() {
    readonly old_pwd="$PWD";
    while [[ 1 ]]; do
        cd ..
        if [[ "$PWD" == "/" ]]; then
            cd "$old_pwd"
            echo "No repository found, returned to $PWD"
            return 1
        fi
        for repo in ".git" ".hg"; do
            if [[ -d "$repo" ]]; then
                echo "Found $repo at $PWD"
                return 0;
            fi
        done
    done
}
```

```shell
dotfiles/local/bin $ up
Found .git at .../dotfiles
dotfiles $
```


### Other utilities

#### Extract domains from URLs

Convert `http://www.foo.com/bar` into `foo.com`.

```bash
domain() {
    local parts=(${1//\// });
    local domain="${parts[1]}"

    if [[ ! "$domain" ]] || [[ "$domain" != *.* ]]; then
        domain="${parts[0]}"
    fi

    echo "${domain/www./}"
}
```


#### `whois`, but a bit smarter

Drop-in replacement for `whois` that accepts URLs and does the parsing for us.

```bash
whois() {
    $(which whois) "$(domain $1)"
    return $?;
}
```


#### Look up DNS entries for a URL

```bash
dns() {
    dig +nocmd "$(domain $1)" any +multiline +noall +answer
}
```

#### Move target $1 to $1.bak

```bash
bak() {
    declare target=$1;
    if [[ "${target:0-1}" = "/" ]]; then
        target=${target%%/}; # Strip trailing / of directories
    fi
    mv -v $target{,.bak}
}
```

```shell
$ bak helpers.bash
helpers.bash -> helpers.bash.bak
```


#### Revert previously bak'd $1 target

```bash
unbak() {
    declare target=$1;
    if [[ "${target:0-1}" = "/" ]]; then
        # Strip trailing / of directories
        target="${target%%/}";
    fi

    if [[ "${target:0-4}" = ".bak" ]]; then
        mv -v "$target" "${target%%.bak}"
    else
        echo "No .bak extension, ignoring: $target"
    fi
}
```

```shell
$ unbak *.bak
helpers.bash.bak -> helpers.bash
```


#### Watch a command for diffs every second

```bash
w() {
    watch -dn1 $*;
}
```


