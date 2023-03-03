#!/usr/bin/env zsh

# set _ENVIRONMENT envvar
export _ENVIRONMENT="osx"

eval "$(/opt/homebrew/bin/brew shellenv)"
# gnu coreutil aliases
alias grep='ggrep'
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

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin"

# Source things
source ~/.zsh/zsh-ssh-agent/ssh-agent.plugin.zsh
source ~/.zsh/gpg_agent.zsh

if [ -e /usr/local/share/zsh/site-functions/_aws ]; then
    source /usr/local/share/zsh/site-functions/_aws
fi

export DYLD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin:/usr/local/bin

export PICO_SDK_PATH=/Users/jchen/src/github.com/raspberrypi/pico-sdk


record_pwd() { pwd > /tmp/.cwd-$USER }

touch /tmp/.cwd-$USER
cd `cat /tmp/.cwd-$USER`

# register hooks
add-zsh-hook chpwd record_pwd

