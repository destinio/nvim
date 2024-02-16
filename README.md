# Nvim 24

## Setup

### Mac
```sh
brew install jesseduffield/lazygit/lazygit
brew install lazygit
```

### Packer
https://github.com/wbthomason/packer.nvim

### Telescope
https://github.com/nvim-telescope/telescope.nvim

```lua
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pp', builtin.find_files, {})
```

[other pickers](https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers)

### UI
- https://github.com/MunifTanjim/nui.nvim?tab=readme-ov-file

### Theme
```lua
-- Packer

use "folke/tokyonight.nvim"

-- after/tokyonight.lua

vim.cmd("colorscheme tokyonight-night") -- for night themes
vim.cmd("colorscheme tokyonight-storm") -- for storm themes
vim.cmd("colorscheme tokyonight-day") -- for day theme
vim.cmd("colorscheme tokyonight-moon") -- for moon theme

```
### Treesitter
https://github.com/nvim-treesitter/nvim-treesitter

**Playground**
https://github.com/nvim-treesitter/playground

`use('nvim-treesitter/playground')`

## LSP
https://github.com/VonHeikemen/lsp-zero.nvim


## Gotchas

### Convert Plug to packer
```
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
```

`:h rtp` - Run Time Path

## Fin

