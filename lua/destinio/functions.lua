local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local api = vim.api

D = {}

D.Links = {
	{
		title = "Repos",
		url = "https://github.com/destinio?tab=repositories",
	},
	{
		title = "New Repo",
		url = "https://github.com/new",
	},
	{
		title = "TW Colors",
		url = "https://tailwindcss.com/docs/customizing-colors",
	},
}

D.Create_url_list_window = function()
	local popup = Popup({
		enter = true,
		focusable = true,
		border = {
			style = "rounded",
		},
		position = "50%",
		size = {
			width = "60%",
			height = "60%",
		},
	})

	popup:on(event.BufLeave, function()
		popup:unmount()
	end)

	local lines = {}

	for _, link in ipairs(D.Links) do
		table.insert(lines, link.url .. " - " .. link.title)
	end

	api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, lines)

	popup:mount()

	-- set mappings
	vim.api.nvim_buf_set_keymap(popup.bufnr, "n", "<CR>", ":URLOpenUnderCursor<CR>:q!<CR>", {})
	vim.api.nvim_buf_set_keymap(popup.bufnr, "n", "<esc>", "<Cmd>q!<CR>", {})
end
