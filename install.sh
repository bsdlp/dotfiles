#!/usr/bin/env bash
set -euo pipefail

if [[ "$(uname)" != "Darwin" ]]; then
    echo "These dotfiles are now macOS-only." >&2
    exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
    echo "Install Homebrew first: https://brew.sh" >&2
    exit 1
fi

brew bundle
./bin/stow

shell="$(command -v zsh)"
if grep -qx "$shell" /etc/shells; then
    chsh -s "$shell"
else
    echo "$shell is not listed in /etc/shells."
    echo "Add it first, then run: chsh -s $shell"
fi
