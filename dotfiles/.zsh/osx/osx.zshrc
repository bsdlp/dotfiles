#!/usr/bin/env zsh

# set _ENVIRONMENT envvar
export _ENVIRONMENT="osx"

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

if [ -d /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/ ]; then
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc'
    source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'
fi

# Source things
source ~/.zsh/zsh-ssh-agent/ssh-agent.plugin.zsh
source ~/.zsh/gpg_agent.zsh

if [ -e /usr/local/share/zsh/site-functions/_aws ]; then
    source /usr/local/share/zsh/site-functions/_aws
fi

export DYLD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin


