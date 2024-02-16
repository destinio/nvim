local M = {}

M.say_hello = function()
	print("Hello from utils.lua")
end

-- copy last yank to system clipboard
M.copy_to_clipboard = function()
	vim.api.nvim_command('let @+ = @"')
end

M.last_pos = function()
	local cursor_pos = M.cur_p()
	vim.api.nvim_win_set_cursor(0, cursor_pos["cp"])
end

M.cur_p = function()
	local cursor_pos = vim.api.nvim_win_get_cursor(0)

	local return_vals = {
		cp = cursor_pos,
		r = cursor_pos[1],
		c = cursor_pos[2],
	}

	return return_vals
end

M.select_all = function()
	vim.api.nvim_command("normal! ggVG")
end

M.format_all = function()
	local pos = M.cur_p()

	M.select_all()

	vim.api.nvim_command("normal! =")

	vim.api.nvim_win_set_cursor(0, pos["cp"])
	print("Formatted")
end

M.copy_buf_contents = function()
	M.select_all()
	vim.api.nvim_command("normal! y")
end

M.copy_all_yank = function()
	M.copy_buf_contents()
	M.last_pos()
end

M.copy_all_clipboard = function()
	M.copy_buf_contents()
	M.copy_to_clipboard()
	M.last_pos()
end

M.cur_word = function()
	return vim.fn.expand("<cword>")
end

return M
