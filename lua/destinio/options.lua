local o = vim.opt
local g = vim.g

-- https://neovim.io/doc/user/lua-guide.html#lua-guide-options

g.mapleader = " "
g.netrw_banner = 0
g.netrw_liststyle = 3

o.number = true
o.relativenumber = true
o.showcmd = true
o.tabstop = 2
o.shiftwidth = 2
o.smartindent = true
o.expandtab = true
o.autoindent = true
o.foldcolumn = "2"
o.wrap = false
o.ignorecase = true
o.smartcase = true
o.cursorline = true
o.cursorcolumn = true
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
o.signcolumn = "yes"
o.listchars = { trail = "•", tab = "⊣>", nbsp = "⊘" }
o.list = true
o.updatetime = 50
o.virtualedit = "block"
-- o.colorcolumn = "80"
