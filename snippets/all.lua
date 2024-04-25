-- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#add-snippets
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#lua
-- https://www.youtube.com/watch?v=KtQZRAkgLqo ep 2
--
local ls = require("luasnip")
local s = ls.snippet

-- nodes
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local parse = ls.parser

-- functions
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta

-- util
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

local function same(index)
  return f(function(arg)
    return arg[1]
  end, { index })
end

local function capitalizeFirstLetter(str)
  return str:gsub("^%l", string.upper)
end

return {
  s({ trig = "con", name = "console.log", desc = "A console log that covers everything!", priority = 10000 }, {
    c(1, {
      fmt("console.log({}){}", { i(1), i(0) }),
      fmta("console.log({<text>})<e>", { text = i(1), e = i(0) }),
      fmt('console.log("{}", {}){}', { same(1), i(1), i(0) }),
    }),
  }),
  s(
    "```",
    fmt(
      [[```{}
{}
```]],
      { i(1), i(0) }
    )
  ),
  s(
    "code",
    fmt(
      [[```{}
{}
```]],
      { i(1), i(0) }
    )
  ),
  s("ddd", fmt("nd we {}!", { i(1) })),
  s(
    { trig = "us", name = "useState", desc = "React useState" },
    fmt("const [{}, {}] = useState({}){}", {
      i(1),
      f(function(args, parent)
        -- return string.toupper(args[1][1])
        local word = args[1][1]
        return "use" .. capitalizeFirstLetter(word)
      end, { 1 }),
      i(2),
      i(0),
    })
  ),
  -- interesting
  -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#lsp-snippets
  parse.parse_snippet({ trig = "wow" }, "Hello, world! $TM_FILENAME"),
}, {
  s(
    "curtime",
    f(function()
      return os.date("%m-%d-%Y")
    end)
  ),
}
