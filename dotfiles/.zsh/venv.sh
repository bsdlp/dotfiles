#!/usr/bin/env zsh

if [ -e /usr/local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.venvs
    export VIRTUALENVWRAPPER_PYTHON=$(which python3)
    mkdir -p $WORKON_HOME
    source /usr/local/bin/virtualenvwrapper.sh

    if [ $(git rev-parse --git-dir > /dev/null 2>&1) ] ; then
        _GITREPO=$(basename `git rev-parse --show-toplevel`)
        alias mkvenv='mkvirtualenv $_GITREPO'
    else
        alias mkvenv='mkvirtualenv $(basename "$PWD")'
    fi

    alias mkvenv2='mkvenv -p $(which python2)'

fi

