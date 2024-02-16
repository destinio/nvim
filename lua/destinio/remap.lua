vim.g.mapleader = " "

local opts = {
	silent = true,
}

local function nm(keys, cmd)
	vim.keymap.set("n", keys, cmd, opts)
end

local function im(keys, cmd)
	vim.keymap.set("i", keys, cmd, opts)
end

local function vm(keys, cmd)
	vim.keymap.set("v", keys, cmd, opts)
end

local function tm(keys, cmd)
	vim.keymap.set("t", keys, cmd, opts)
end

-- NORMAL

nm("tt", ":TroubleToggle<CR>")
-- https://github.com/folke/trouble.nvim?tab=readme-ov-file#commands

--- random
nm("Q", "<nop>") -- disable Q

--- BUFFERS
nm("<leader>bb", ":buffers<CR>") -- list buffers
nm("<leader>bn", ":bnext<CR>") -- next buffer
nm("<leader>bp", ":bprev<CR>") -- prev buffer
nm("<leader>bs", ":ls<CR>:b<space>") -- list buffers and prep for entry
nm("<leader>bh", ":HelpUnderCursor<CR>") -- list buffers and prep for entry
nm("<leader>bf", ":FormatAll<CR>zz") -- format buffer

--- copy and paste
nm("<leader>y", '"*y') -- yank to system clipboard
nm("<leader>Y", '"*Y') -- yank linewise

--- Close things
nm("<leader>cc", ":q<CR>") -- close buffer -- will error if not written
nm("<leader>ct", ":tabclose<CR>") -- close current tab
nm("<leader>cs", ":close<CR>") -- close current split window

--- deletion
nm("x", '"_x')
nm("J", "mzJ`z")

-- Finder NetRW
nm("<leader>pv", vim.cmd.Ex)

-- GIT
-- nm("<leader>gg", ":LazyGit<CR>")

-- Movement
nm("<C-d>", "<C-d>zz") -- center page jumps
nm("<C-u>", "<C-u>zz")

-- REGISTERS
nm("<leader>ra", ":registers<CR>")

-- RUNNERS
nm("<leader>rg", ":w | :!go run %<CR>") -- GO

-- Serach /
-- replace word under cursor
nm("<leader>wr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

nm("n", "nzzzv") -- centers next serach
nm("N", "Nzzzv")

-- Neo Tree
nm("<leader>nn", ":NvimTreeToggle<CR>")

-- HELP WINDOWS
nm("<leader>hh", "<F1><c-w><c-o>") -- open :help and close all others see :h :only
nm("<leader>hv", ":vert :h<CR>") -- open :help in a split window
nm("<leader>ht", ":tab :h<CR>") -- open :help in a split window
nm("<leader>hs", ":h <c-R><c-W><CR>") -- open for the current word
-- look into K for current word. It is remapped to a plugin

-- WINDOWS / SPLITS
nm("<leader>sv", "<c-w>v") -- split window vertically
nm("<leader>sh", "<c-w>s") -- split window horizontally
nm("<leader>se", "<c-w>=") -- make split windows equal width & height
nm("<leader>sx", ":close<CR>") -- close current split window

-- TABS
nm("<leader>to", ":tabnew<CR>") -- open new tab
nm("<leader>tx", ":tabclose<CR>") -- close current tab
nm("<leader>tn", ":tabn<CR>") --  go to next tab
nm("<leader>tp", ":tabp<CR>") --  go to previous tab

-- spell
nm("<leader>ss", ":set spell!<cr>")

-- telescope
--
-- https://github.com/nvim-telescope/telescope.nvim#default-mappings
local builtin = require("telescope.builtin")

-- All files that are not git ignored. Only works in git directory
-- usee ff if not is git directory
-- LSP

-- errors

nm("K", function()
	vim.lsp.buf.hover()
end)

nm("<leader><leader>", function()
	vim.diagnostic.open_float()
end)

nm("gee", function()
	vim.diagnostic.goto_next()
end)
nm("]d", function()
	vim.diagnostic.goto_prev()
end)
nm("<leader>.", function()
	vim.lsp.buf.code_action()
end)
nm("<leader>rn", function()
	vim.lsp.buf.rename()
end)

nm("<leader>fo", builtin.oldfiles)
nm("<leader>ff", builtin.find_files)
nm("<leader>fs", builtin.live_grep)
nm("<leader>fx", builtin.spell_suggest)
nm("<leader>gg", builtin.git_status)

nm("<leader>fb", builtin.buffers)
nm("<leader>fr", builtin.registers)
nm("<leader>fh", builtin.help_tags)

nm("<leader>fc", builtin.commands)
nm("<leader>fj", builtin.jumplist)
nm("<leader>fk", builtin.keymaps)
nm("<leader>fy", builtin.lsp_document_symbols)
nm("<leader>fm", builtin.marks)
-- git
nm("<leader>gf", builtin.git_files)
nm("<leader>gc", builtin.git_commits)
nm("<leader>gl", "<cmd>LazyGit<cr>")

nm("<leader>gd", builtin.lsp_definitions)
nm("<leader>gi", builtin.lsp_implementations)
nm("<leader>gr", builtin.lsp_references)
nm("<leader>gt", builtin.lsp_type_definitions)
-- project
nm("<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Search: ") })
end)

-- whaaat
nm("<leader>gw", ":Whaaat<CR>")

nm("<leader>xx", "<cmd>TroubleToggle<cr>")
nm("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
nm("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
nm("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
nm("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nm("gR", "<cmd>TroubleToggle lsp_references<cr>")

nm("<leader>zz", ":ZenMode<CR>")

nm("<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>")
nm("<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>")
nm("<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>")
nm("<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>")
nm("<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>")
nm("<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>")
nm("<leader><Right>", "<cmd>BufferLineCycleNext<cr>")
nm("<leader><Left>", "<cmd>BufferLineCyclePrev<cr>")

-- INSERT
im("jj", "<esc>") -- fast <esc>
im("jw", "<esc>:w<cr>") -- <esc> and save

-- VISUAL
vm("<leader>y", '"+y')

--- move lines up and down
vm("J", ":m '>+1<CR>gv=gv")
vm("K", ":m '<-2<CR>gv=gv")

-- TERMINAL
-- nm("gt", ":FloatermToggle<CR>")
tm("<esc>", "<C-\\><C-n>:FloatermToggle<CR>")
