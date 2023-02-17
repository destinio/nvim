local hotness = require("destin.hotness")

local api = vim.api
local uc = api.nvim_create_user_command
local ac = api.nvim_create_autocmd

local group = vim.api.nvim_create_augroup("EditNotes", { clear = true })

ac("BufEnter", {
	pattern = "*.md",
	callback = function()
		vim.opt_local.spell = true
	end,
	group = group,
})

uc("CurrentWord", function()
	local current_word = vim.call("expand", "<cword>")
	api.nvim_command("vert h " .. current_word)

	hotness.add_local_win_quit()
end, {})

uc("OpenNotes", function()
	hotness.create_window()
	api.nvim_command("edit ~/NOTES/random.md")
end, {})

uc("DefineWord", function()
	local current_word = vim.call("expand", "<cword>")

	hotness.create_window()

	-- local t = api.nvim_exec("!curl dict://dict.org/d:" .. current_word, { output = true })
	api.nvim_command("read !curl dict://dict.org/d:" .. current_word)
	api.nvim_command("normal gg5dd")

	hotness.add_local_win_quit()
end, {})
