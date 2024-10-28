ROOT := $(PWD)

.PHONY: \
	fetch

fetch:
	cp -r ~/.config/nvim/lua $(ROOT)/

sync: fetch
	git commit -am "$(msg)" && git push
