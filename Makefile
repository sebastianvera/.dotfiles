stow_dirs = $(wildcard */)

all: install

.PHONY: install
install:
	stow --target $(HOME) --verbose $(stow_dirs)

.PHONY : dry-run
dry-run :
	stow --no --target $(HOME) --verbose $(stow_dirs)

.PHONY : restow
restow :
	stow --target $(HOME) --verbose --restow $(stow_dirs)

.PHONY: uninstall
uninstall:
	stow --target $(HOME) --verbose --delete $(stow_dirs)
