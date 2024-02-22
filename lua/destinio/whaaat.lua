local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

local M = {}

local get_whaaat_file_contents = function()
	local file_path = vim.fn.expand("~/.config/whaaat-cli/whaaats.txt")
	local file = io.open(file_path, "r")

	if not file then
		print("File not found: " .. file_path)
		return nil
	end

	local contents = file:read("*all")
	file:close()

	return contents
end

local convert_whaaats_to_table = function()
	local file = get_whaaat_file_contents()

	if not file then
		return {}
	end

	local whaaats = {}

	for line in file:gmatch("[^\r\n]+") do
		local cols = {}

		for col in line:gmatch("[^|]+") do
			table.insert(cols, col)
		end

		table.insert(whaaats, cols[2])
	end

	return whaaats
end

M.test = function()
	local file = convert_whaaats_to_table()

	if not file then
		print("No file found")
		return
	end

	local popup = Popup({
		enter = true,
		focusable = true,
		border = {
			style = "rounded",
		},
		position = "50%",
		size = {
			width = "80%",
			height = "60%",
		},
	})

	popup:on(event.BufLeave, function()
		popup:unmount()
	end)

	popup:mount()

	vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, file)
	vim.api.nvim_buf_set_keymap(popup.bufnr, "n", "q", "<Cmd>q!<CR>", {})
	vim.api.nvim_buf_set_keymap(popup.bufnr, "n", "o", ":URLOpenUnderCursor<CR>q!<cr>", {})
end

return M
