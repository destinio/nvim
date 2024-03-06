-- Prevent comment continuation
local api = vim.api
local uc = api.nvim_create_user_command
local ac = api.nvim_create_autocmd

local utils = require("destinio.utils")

local group = vim.api.nvim_create_augroup("DestinIO", { clear = true })

vim.cmd("autocmd BufEnter * set formatoptions-=cro")

ac("BufEnter", {
	pattern = "*.md",
	callback = function()
		vim.opt_local.spell = true
	end,
	group = group,
})
--
uc("Whaaat", function()
	local whaaat = require("destinio.whaaat")
	whaaat.test()
end, {})

uc("QuickDate", function()
	local timestamp = vim.fn.system("date +%m:%d:%Y")
	timestamp = timestamp:gsub("\n", "")

	vim.fn.setreg('"', "\n## " .. timestamp .. "\n")

	vim.cmd("normal! GpG")
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

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
