#!/usr/bin/env bash

sudo apt update && sudo apt install -y stow make
rm -rf ~/.zshrc
make update
sudo chsh -s /usr/bin/zsh
