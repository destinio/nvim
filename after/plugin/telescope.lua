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

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, {})
