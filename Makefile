#!/usr/bin/env make

install: brew stow shell

update: brew stow

brew:
	brew bundle

stow:
	./bin/stow

shell:
	@shell="$$(command -v zsh)"; \
	if ! grep -qx "$$shell" /etc/shells; then \
		echo "$$shell is not listed in /etc/shells."; \
		echo "Add it first, then rerun: make shell"; \
		exit 1; \
	fi; \
	chsh -s "$$shell"

.PHONY: install update brew stow shell
