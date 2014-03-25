#!/usr/bin/env make

ZSH_PATH = 

install: install_submodules install_needful shell

install_submodules:
	git submodule init
	git submodule update

install_needful:
	git pull
	./bin/stow

shell:
	$(shell chsh --shell $(shell which zsh))

uninstall:
	./bin/fuckoff

.PHONY: shell

