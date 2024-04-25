-- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#add-snippets
-- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#lua
-- https://www.youtube.com/watch?v=KtQZRAkgLqo ep 2

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

return {}, {}
