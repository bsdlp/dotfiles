#!/usr/bin/env zsh

# set _ENVIRONMENT envvar
export _ENVIRONMENT="fbsd"

# coreutil aliases
alias ls='gls --color=auto --group-directories-first'
alias l='ls'
alias mv='gmv -i'
alias cp='gcp -i'
alias rm='grm -i'
alias sed='gsed'

# package manager aliases
alias upgrade='sudo pkg update && sudo pkg upgrade'

