local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
})

ls.add_snippets(nil, {
	all = {
		ls.snippet("trig", ls.text_node("-- hotness")),
	},

	javascript = {
		ls.snippet("cll", ls.text_node("console.log()")),
	},
})

-- require("luasnip.loade:s.from_lua").lazy_load({ paths = "~/.config/nvim/snippets/" })
