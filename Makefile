#!/usr/bin/env make

install: install_submodule install_needful

install_submodules:
	git submodule init
	git submodule update

install_needful:
	git pull
	./bin/stow

uninstall:
	./bin/fuckoff

