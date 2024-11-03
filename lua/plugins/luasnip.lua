local ls = require("luasnip")
local gosnips = require("snippets/go")

ls.add_snippets("go", gosnips)
ls.add_snippets("lua", {
	ls.snippet("hello", {
		ls.text_node("echo hello world")
	})
})
