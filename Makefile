#!/usr/bin/env make

ZSH_PATH = $(shell which zsh)

install: install_submodules install_needful

install_submodules:
	git submodule init
	git submodule update

install_needful:
	git pull
	./bin/stow
	$(shell chsh -s $$ZSH_PATH)

uninstall:
	./bin/fuckoff

