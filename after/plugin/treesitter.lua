require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"c",
		"bash",
		"lua",
		"vim",
		"vimdoc",
		"query",
		"javascript",
		"typescript",
		"tsx",
		"php",
		"phpdoc",
		"go",
		"html",
		"css",
		"csv",
		"json",
		"make",
	},
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
