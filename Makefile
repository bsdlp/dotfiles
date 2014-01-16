#!/usr/bin/env make

install:
	install_submodules install_needful

install_submodules:
	git submodule init
	git submodule update

install_needful:
	git update
	./bin/stow

uninstall:
	./bin/fuckoff

