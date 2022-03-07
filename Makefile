.PHONY: install stylua

install:
	cargo install stylua

stylua:
	find . -name '*.lua' -type f | xargs stylua
