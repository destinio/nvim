local o = vim.opt
local g = vim.g

g.mapleader = " "

-- netrw -- working with how I want to use netrw
g.netrw_banner = 0
g.netrw_liststyle = 3
-- g.netrw_browse_split = 4
-- g.netrw_winsize = 80
-- g.netrw_preview = 1
-- g.netrw_alto = "splitright"

o.shell = "/bin/zsh" -- set shell to zsh

o.number = true
o.relativenumber = true
o.showcmd = true
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.foldcolumn = "2"
o.wrap = false
o.ignorecase = true
o.smartcase = true
o.cursorline = true
o.cursorcolumn = true
o.termguicolors = true
o.background = "dark"
o.signcolumn = "yes"
o.backspace = "indent,eol,start"
o.completeopt = "menu,menuone,noselect"
o.hlsearch = false
o.incsearch = true
o.splitright = true
o.splitbelow = true
o.wildmenu = true
o.wildmode = "full"
o.swapfile = false
o.backup = false
o.scrolloff = 12
o.updatetime = 50
o.confirm = true
o.history = 200
o.spelllang = "en_us"
o.spellcapcheck = ""
vim.opt.listchars = { trail = "•", tab = "⊣>", nbsp = "⊘" }
o.list = true
o.virtualedit = "block"

-- Prevent comment continuation
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
