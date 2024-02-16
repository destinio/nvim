-- Prevent comment continuation
local api = vim.api
local uc = api.nvim_create_user_command
local ac = api.nvim_create_autocmd

local utils = require("destinio.utils")

local group = vim.api.nvim_create_augroup("DestinIO", { clear = true })

ac("BufEnter", {
	pattern = "*.md",
	callback = function()
		vim.opt_local.spell = true
	end,
	group = group,
})

-- vim.cmd("autocmd BufEnter * set formatoptions-=cro")
--
uc("Whaaat", function()
	local whaaat = require("destinio.whaaat")
	whaaat.test()
end, {})

uc("Links", function()
	D.Create_url_list_window()
end, {})

uc("SelectAll", function()
	api.nvim_command("normal! ggVG")
end, {})

uc("CopyAll", function()
	utils.copy_all_yank()
end, {})

uc("CopyContentsOfBufToClipboard", function()
	utils.copy_all_clipboard()
end, {})

uc("FormatAll", function()
	utils.format_all()
end, {})

uc("HelpUnderCursor", function()
	vim.cmd("help " .. utils.cur_word())
end, {})

-- TODOS
