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

setjdk() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
}

if [ -d /Users/jchen/google-cloud-sdk ]; then
    source /Users/jchen/google-cloud-sdk/path.zsh.inc
fi

# Source things
source ~/.zsh/zsh-ssh-agent/ssh-agent.plugin.zsh
source ~/.zsh/gpg_agent.zsh

if [ -e /usr/local/share/zsh/site-functions/_aws ]; then
    source /usr/local/share/zsh/site-functions/_aws
fi

# Apple logo!
~/.zsh/archey-osx -c
