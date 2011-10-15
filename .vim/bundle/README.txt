How to add a new bundle submodule:

    git submodule add <git url> .vim/bundle/<name>
    git submodule init
    git submodule update
    git submodule foreach git submodule init
    git submodule foreach git submodule update
