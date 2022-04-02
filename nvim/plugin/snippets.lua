local ls = require "luasnip"

ls.snippets = {
  all = {
    ls.parser.parse_snippet("expand", "expand")
  }
}
