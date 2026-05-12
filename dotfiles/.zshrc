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
    "$HOME/.cargo/bin"
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
if (( $+commands[gls] )); then
    alias ls='gls --color=auto --group-directories-first'
elif [[ "$OSTYPE" == darwin* ]]; then
    export CLICOLOR=1
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias l='ls'
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

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#f38ba8'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#cba6f7'
ZSH_HIGHLIGHT_STYLES[command]='fg=#89b4fa'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#89b4fa'
ZSH_HIGHLIGHT_STYLES[function]='fg=#89b4fa'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#89b4fa'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=#89b4fa'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#cba6f7'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#f5c2e7'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=#89b4fa'
ZSH_HIGHLIGHT_STYLES[path]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=#6c7086'
ZSH_HIGHLIGHT_STYLES[globbing]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=#f9e2af'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#fab387'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#fab387'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=#a6e3a1'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#f5c2e7'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#f5c2e7'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=#f5c2e7'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#f5c2e7'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#6c7086'

# zsh-syntax-highlighting must be sourced after widgets, completion, and keybinds.
if [[ -n "$HOMEBREW_PREFIX" && -r "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi
