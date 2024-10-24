ROOT := $(PWD)

.PHONY: \
	fetch

fetch:
	cp -r ~/.config/nvim/lua $(ROOT)/
