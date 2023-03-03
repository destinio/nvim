-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

local dropdown = require("telescope.themes").get_dropdown()

telescope.setup({
	defaults = {
		borderchars = dropdown.borderchars,
		sorting_strategy = "ascending",
		layout_strategies = "flex",
		results_title = false,
		file_ignore_patterns = { "node_modules", "dist" },
		layout_config = {
			preview_cutoff = 1,
			prompt_position = "top",
			vertical = {
				anchor = "N",
				mirror = true,
			},
			flex = {
				flip_columns = 120,
			},
		},
		prompt_prefix = "❯ ",
		selection_caret = "❯ ",
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<esc>"] = actions.close, -- move to next result
				["<C-u>"] = false,
			},
		},
		-- ...
	},
})
