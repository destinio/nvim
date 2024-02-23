require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "node_modules", ".git" },
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

pcall(require("telescope").load_extension, "fzf")
