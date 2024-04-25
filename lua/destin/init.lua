if vim.loader then
  vim.loader.enable()
end

require("destin.opts")
require("destin.remaps")
require("destin.lazy_init") -- thanks prime
require("destin.commands")
require("destin.pickers")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25
