vim.g.mapleader = " "

local opts = {
	silent = true,
}

local function nmap(keys, cmd)
	vim.keymap.set("n", keys, cmd, opts)
end

local function imap(keys, cmd)
	vim.keymap.set("i", keys, cmd, opts)
end

local function vmap(keys, cmd)
	vim.keymap.set("v", keys, cmd, opts)
end

local function tmap(keys, cmd)
	vim.keymap.set("t", keys, cmd, opts)
end

-- DESTIN THIHGS
nmap("<leader>cw", ":CurrentWord<cr>")
nmap("<leader>dw", ":DefineWord<cr>")

-- random
nmap("Q", "<nop>") -- disable Q

-- Better <ESC>
imap("jj", "<esc>") -- fast <esc>
imap("jk", "<esc>:w<cr>") -- <esc> and save

-- BUFFERS
nmap("<leader>bb", ":buffers<CR>") -- list buffers
nmap("<leader>bn", ":bnext<CR>") -- next buffer
nmap("<leader>bp", ":bprev<CR>") -- prev buffer
nmap("<leader>bs", ":ls<CR>:b<space>") -- list buffers and prep for entry

-- copy and paste
nmap("<leader>y", '"+y') -- yank to system clipboard
nmap("<leader>Y", '"+Y') -- yank linewise

-- Close things
nmap("<leader>cc", ":q<CR>") -- close buffer -- will error if not written
nmap("<leader>ct", ":tabclose<CR>") -- close current tab
nmap("<leader>cs", ":close<CR>") -- close current split window

-- deletion
nmap("x", '"_x')
nmap("J", "mzJ`z")

--EDITING
imap("jl", "<esc>o") -- exit insert mode and drop to new line

-- Formatting
nmap("<leader>rr", function()
	vim.lsp.buf.format()
end)

nmap("<leader>on", ":on<CR>") -- close all but current buffer

-- Finder NetRW
nmap("<leader>pv", vim.cmd.Ex)
nmap("<leader>pp", ":NvimTreeToggle<cr>")

-- GIT
nmap("<leader>gg", ":LazyGit<CR>")

-- Movement
nmap("<C-d>", "<C-d>zz") -- center page jumps
nmap("<C-u>", "<C-u>zz")

-- Notes
nmap("<leader>gn", ":OpenNotes<CR>")

-- REGISTERS
nmap("<leader>ra", ":registers<CR>")

-- RUNNERS
nmap("<leader>rg", ":w | :!go run %<CR>") -- GO

-- Serach /
-- replace word under cursor
nmap("<leader>wr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

nmap("n", "nzzzv") -- centers next serach
nmap("N", "Nzzzv")

-- HELP WINDOWS
nmap("<leader>hh", "<F1><c-w><c-o>") -- open :help and close all others see :h :only
nmap("<leader>hv", ":vert :h<CR>") -- open :help in a split window
nmap("<leader>ht", ":tab :h<CR>") -- open :help in a split window
nmap("<leader>hs", ":h <c-R><c-W><CR>") -- open for the current word
-- look into K for current word. It is remapped to a plugin

-- WINDOWS / SPLITS
nmap("<leader>sv", "<c-w>v") -- split window vertically
nmap("<leader>sh", "<c-w>s") -- split window horizontally
nmap("<leader>se", "<c-w>=") -- make split windows equal width & height
nmap("<leader>sx", ":close<CR>") -- close current split window

-- TABS
nmap("<leader>to", ":tabnew<CR>") -- open new tab
nmap("<leader>tx", ":tabclose<CR>") -- close current tab
nmap("<leader>tn", ":tabn<CR>") --  go to next tab
nmap("<leader>tp", ":tabp<CR>") --  go to previous tab

-- vis
vmap("<leader>y", '"+y')
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- spell
nmap("<leader>ss", ":set spell!<cr>")

-- telescope
--
-- https://github.com/nvim-telescope/telescope.nvim#default-mappings
local builtin = require("telescope.builtin")

-- All files that are not git ignored. Only works in git directory
-- usee ff if not is git directory
nmap("<c-p>", builtin.git_files)

nmap("<leader>ff", builtin.find_files)
nmap("<leader>fs", builtin.live_grep)
nmap("<leader>fx", builtin.spell_suggest)

nmap("<leader>fb", builtin.buffers)
nmap("<leader>fr", builtin.registers)
nmap("<leader>fh", builtin.help_tags)

nmap("<leader>fc", builtin.commands)
nmap("<leader>fj", builtin.jumplist)
nmap("<leader>fk", builtin.keymaps)
nmap("<leader>fy", builtin.lsp_document_symbols)
nmap("<leader>fm", builtin.marks)
-- git
nmap("<leader>gs", builtin.git_status)
nmap("<leader>gc", builtin.git_commits)

nmap("<leader>gd", builtin.lsp_definitions)
nmap("<leader>gi", builtin.lsp_implementations)
nmap("<leader>gr", builtin.lsp_references)
nmap("<leader>gt", builtin.lsp_type_definitions)
-- project
nmap("<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Search: ") })
end)

nmap("<leader>xx", "<cmd>TroubleToggle<cr>")
nmap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
nmap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
nmap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
nmap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nmap("gR", "<cmd>TroubleToggle lsp_references<cr>")

nmap("<leader>zz", ":ZenMode<CR>")

-- terminal

nmap("<F5>", ":FloatermToggle<CR>")
tmap("<F5>", "<C-\\><C-n>:FloatermToggle<CR>")
