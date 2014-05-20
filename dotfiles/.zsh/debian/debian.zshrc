#!/usr/bin/env zsh

# set _ENVIRONMENT envvar
export _ENVIRONMENT="debian"

# coreutil aliases
alias ls='ls --color=auto --group-directories-first'
alias l='ls'
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -i'

# package manager aliases
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
alias install='sudo apt-get install '
alias purge='sudo apt-get purge '

export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
