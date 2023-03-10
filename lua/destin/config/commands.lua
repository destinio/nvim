local hotness = require("destin.hotness")

local api = vim.api
local uc = api.nvim_create_user_command
local ac = api.nvim_create_autocmd

local group = vim.api.nvim_create_augroup("Hotness", { clear = true })

-- Auto Commands
ac("BufEnter", {
	pattern = "*.md",
	callback = function()
		vim.opt_local.spell = true
	end,
	group = group,
})

-- User Commands
uc("RunGo", function()
	api.nvim_command("vsplit")

	local win = api.nvim_get_current_win()
	local buf = api.nvim_create_buf(false, true)

	api.nvim_win_set_buf(win, buf)
	hotness.add_local_win_quit()
end, {})

uc("CurrentWord", function()
	local current_word = vim.call("expand", "<cword>")
	api.nvim_command("vert h " .. current_word)
	hotness.add_local_win_quit()
end, {})

uc("DefineWord", function()
	local current_word = vim.call("expand", "<cword>")

	hotness.create_window()

	-- local t = api.nvim_exec("!curl dict://dict.org/d:" .. current_word, { output = true })
	api.nvim_command("read !curl dict://dict.org/d:" .. current_word)
	api.nvim_command("normal gg5dd")

	hotness.add_local_win_quit()
end, {})
