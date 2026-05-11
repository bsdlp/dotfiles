# Keep startup small and macOS-focused.
autoload -Uz compinit
compinit

setopt auto_cd
setopt interactive_comments
setopt prompt_subst
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history

export HISTFILE="$HOME/.zshistory"
export HISTSIZE=10000
export SAVEHIST=10000

export EDITOR=nvim
export VISUAL=nvim

if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

path=(
    "$HOME/bin"
    "$HOME/.local/bin"
    $path
)
typeset -U path

source "$HOME/.zsh/git-prompt.zsh"
source "$HOME/.zsh/prompt-config.zsh"

bindkey -v
export KEYTIMEOUT=1

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^W' backward-kill-word
bindkey '^R' history-incremental-search-backward

alias c='clear'
alias cdc='cd; clear'
alias cls='clear && ls'
alias grep='LC_ALL=C grep'
alias rake='noglob rake'
alias bower='noglob bower'
alias v='nvim'
alias vim='nvim'
alias vi='nvim'
alias vit='nvim ~/.todo.txt'
alias vime='command vim -u ~/.vimencrypt -x'

calc() { awk "BEGIN { print $* }"; }

if [[ -r "$HOME/.zshrc.local" ]]; then
    source "$HOME/.zshrc.local"
fi

# Keep this near the end so project tools win PATH precedence.
if (( $+commands[mise] )); then
    eval "$(mise activate zsh)"
fi

# zsh-syntax-highlighting must be sourced after widgets, completion, and keybinds.
if [[ -n "$HOMEBREW_PREFIX" && -r "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
