vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use("navarasu/onedark.nvim") -- theme

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use("nvim-lualine/lualine.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use({
		"VonHeikemen/lsp-zero.nvim",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis

	-- langs

	-- GO
	use("fatih/vim-go", { run = ":GoUpdateBinaries" })

	-- utils
	use("rcarriga/nvim-notify")
	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("j-hui/fidget.nvim") -- fun stats in bottom right
	-- use("f-person/git-blame.nvim")
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
	use("tpope/vim-fugitive")
	use("folke/zen-mode.nvim")
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags
	use("voldikss/vim-floaterm")
	use("tpope/vim-unimpaired")
	use("kdheepak/lazygit.nvim")
	use("theprimeagen/harpoon")
	use("tpope/vim-sleuth")
	use("/Users/destin.lee/Documents/MY_APPS/whaaat.nvim")
	use({
		"mskelton/local-yokel.nvim",
		config = function()
			require("local-yokel").setup()
		end,
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				icons = false,
			})
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	})

	use({
		"ellisonleao/glow.nvim",
		config = function()
			require("glow").setup()
		end,
	})
end)
