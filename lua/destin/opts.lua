-- Set auto now in .10
-- vim.opt.termguicolors = true

vim.opt.background = "dark"

-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.pumheight = 10

-- spell
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- statusline stuff
vim.o.laststatus = 3                         -- Only show status line for the current buffer
vim.cmd("highlight WinSeparator guibg=None") -- make the divider line thin

vim.opt.showmode = false

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true

vim.opt.mouse = "a"

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.breakindent = true

-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- All things wrapping
vim.opt.wrap = false
-- vim.api.nvim_set_keymap("n", "j", "(v:count == 0 ? 'gj' : 'j')", { expr = true, noremap = true })
-- vim.api.nvim_set_keymap("n", "k", "(v:count == 0 ? 'gk' : 'k')", { expr = true, noremap = true })

-- Sets how neovim will display certain whitespace in the editor.
-- vim.opt.list = true
-- vim.opt.listchars = { trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- vim.opt.cursorline = true
--
vim.opt.scrolloff = 10

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
