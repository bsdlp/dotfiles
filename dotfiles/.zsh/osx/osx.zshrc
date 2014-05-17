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
export SCALA_HOME=/usr/local/opt/scala
export PATH="$PATH:$SCALA_HOME/bin"

# Apple logo!
~/.zsh/archey-osx -c

