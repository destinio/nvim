vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = {
  silent = true,
}

-- KEYMAPS
vim.api.nvim_set_keymap("i", "jj", "<Esc>", opts)
vim.api.nvim_set_keymap("i", "kk", "<Esc>", opts)
vim.api.nvim_set_keymap("i", "jw", "<Esc>:w<cr>", opts)

-- help vertical split
vim.api.nvim_set_keymap("n", "<leader>h", "", {
  silent = true,
  desc = "[H]elp Cursor Word",
  callback = function()
    vim.cmd(":vertical help " .. vim.fn.expand("<cword>"))
  end
})

-- +x your file bro
vim.keymap.set("n", "<leader>x", "<cmd>source %<CR>", { silent = true, desc = "Source File" })

-- Explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Netrw" })

-- move selected lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- combine lines better
vim.keymap.set("n", "J", "mzJ`z")

-- better paging
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
