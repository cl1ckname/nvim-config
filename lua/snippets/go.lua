-- DOCS:
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#snippets
--
-- GLOBAL VARS:
-- https://github.com/L3MON4D3/LuaSnip/blob/69cb81cf7490666890545fef905d31a414edc15b/lua/luasnip/config.lua#L82-L104§

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local parse = ls.parser.parse_snippet

return {
	s({ trig = "co", name = "Constant", dscr = "Insert a constant" }, {
		t("const "), i(1, "name"), t(" = "), i(2, "value")
	}),

	s({ trig = "pf", name = "Formatted Print", dscr = "Insert a formatted print statement" }, {
		t("fmt.Printf(\"%#v\\n\", "), i(1, "value"), t(")")
	}),

	s({ trig = "lln", name = "Log newline", dscr = "Insert log with newline" }, {
		t("log.Println(\""),
		i(1, "content"),
		t("\")"),
	}),

	s({ trig = "werr", name = "Wrapped error", dscr = "Wrap error with fmt.Errorf" }, {
		t("fmt.Errorf(\""),
		i(1, "message"),
		t(": %w\", err)")
	}),

	parse({ trig = "ife", name = "If Err", dscr = "Insert a basic if err not nil statement" }, [[
  if err != nil {
    return err
  }
  ]]),

	parse({ trig = "ifel", name = "If Err Log Fatal", dscr = "Insert a basic if err not nil statement with log.Fatal" },
		[[
  if err != nil {
    log.Fatal(err)
  }
  ]]),

	s({ trig = "ifew", name = "If Err Wrapped", dscr = "Insert a if err not nil statement with wrapped error" }, {
		t("if err != nil {"),
		t({ "", "  return fmt.Errorf(\"failed to " }),
		i(1, "message"),
		t(": %w\", err)"),
		t({ "", "}" })
	}),

	parse({ trig = "ma", name = "Main Package", dscr = "Basic main package structure" }, [[
  package main

  import "fmt"

  func main() {
    fmt.Printf("%+v\n", "...")
  }
  ]]),
	parse({ trig = "ftest", name = "Test function", dscr = "Insert simple test function" }, [[
func Test${1:Name}(t *testing.T) {
	$2
}]]),
	parse({ trig = "mtest", name = "Test method", dscr = "Insert method for testify suite" }, [[
func (${1:suite}) Test${2:Name}() {
	$3
}]])

}
