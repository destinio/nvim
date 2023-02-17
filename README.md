# Welcome
Inspired By:
https://www.youtube.com/watch?v=w7i4amO_zaE
https://www.youtube.com/watch?v=stqUbv-5u2s

## Install NeoVim
https://github.com/neovim/neovim/wiki/Installing-Neovim#macos--os-x

## Install Packer
https://github.com/wbthomason/packer.nvim#quickstart

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

```sh
cd ~

mkdir -p .config/nvm/lua

touch .config/init.lua
touch .config/plugins.lua

nvim .config/plugins.lua
```

```lua
-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
end)
``

restart neovim

`:PackerSync`
