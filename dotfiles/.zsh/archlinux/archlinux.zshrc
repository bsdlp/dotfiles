#!/usr/bin/env zsh

alias l='ls'

if [ -e /usr/local/share/zsh/site-functions/_aws ]; then
    source /usr/local/share/zsh/site-functions/_aws
fi

archey
