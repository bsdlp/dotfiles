#!/usr/bin/env make

install: install_submodules install_needful shell

update: install_submodules install_needful

install_submodules:
	git submodule init
	git submodule update

install_needful:
	git pull
	./bin/stow

shell:
	$(shell chsh --shell $(shell which zsh))

pyinstall:
	pip install virtualenvwrapper

uninstall:
	./bin/fuckoff

.PHONY: shell

