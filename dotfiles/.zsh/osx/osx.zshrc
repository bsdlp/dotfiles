#!/usr/bin/env zsh

# set _ENVIRONMENT envvar
export _ENVIRONMENT="osx"

# gnu coreutil aliases
alias cp='gcp -i'
alias find='gfind'
alias ls='gls --color=auto --group-directories-first'
alias l='ls'
alias mv='gmv -i'
alias readlink='greadlink'
alias rm='grm -i'
alias sed='gsed'

# Go jawns
export GOROOT=/usr/local/opt/go/libexec

# Scala
if [ -d /usr/local/opt/scala ]; then
    export SCALA_HOME=/usr/local/opt/scala
    export PATH="$PATH:$SCALA_HOME/bin"
fi

if [ -d /Users/jchen/google-cloud-sdk ]; then
    source /Users/jchen/google-cloud-sdk/path.zsh.inc
fi

if [ -f ~/.zsh/golang-crosscompile/crosscompile.bash ]; then
    source ~/.zsh/golang-crosscompile/crosscompile.bash
fi

# Apple logo!
~/.zsh/archey-osx -c

