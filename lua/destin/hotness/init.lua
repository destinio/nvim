local api = vim.api

local M = {}

M.create_v_split = function()
	api.nvim_command("vsplit")

	local win = api.nvim_get_current_win()
	local buf = api.nvim_create_buf(false, true)

	api.nvim_win_set_buf(win, buf)
end

M.create_window = function()
	local rows = api.nvim_list_uis()[1].height
	local cols = api.nvim_list_uis()[1].width

	local buf = api.nvim_create_buf(false, true)

	api.nvim_open_win(buf, true, {
		relative = "editor",
		width = math.floor(cols / 2),
		height = math.floor(rows / 2),
		row = math.floor((rows / 2) * 0.5),
		col = math.floor((cols / 2) * 0.5),
		border = "rounded",
		style = "minimal",
	})

	return { buf_num = buf }
end

M.add_local_win_quit = function()
	api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", {
		silent = true,
	})
end

M.alert = function(...)
	require("notify")(...)
end

M.get_keys = function(t)
	local keys = {}

	for key, _ in pairs(t) do
		table.insert(keys, key)
	end
end

M.say_hello = function()
	print("Hello from the hotness")
end

return M
