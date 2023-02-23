#!/usr/bin/env bash

sudo apt update && sudo apt install -y stow make
make update
conda init zsh
