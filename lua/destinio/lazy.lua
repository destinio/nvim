vim.g.mapleader = " "
vim.g.maplocalleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "folke/tokyonight.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
	},
	{ "ThePrimeagen/harpoon" },
	{ "nvim-tree/nvim-tree.lua" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	},
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp",
		dependencies = {
			"nvim-cmp",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{ "folke/neodev.nvim" }, -- Additional lua configuration
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" }, -- :GBrowse
	{ "tpope/vim-sleuth" },
	{ "mfussenegger/nvim-dap" },
	{ "mxsdev/nvim-dap-vscode-js" },
	{ "rcarriga/nvim-dap-ui" },
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>rz", function()
				lint.try_lint()
			end)
		end,
	},
	{
		"stevearc/conform.nvim",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					javascriptreact = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					graphql = { "prettier" },
					markdown = { "prettier" },
					yaml = { "prettier" },
					go = { "gofmt" },
					php = { "php-cs-fixer" },
					python = { "isort", "black" },
					lua = { "stylua" },
				},
				format_on_save = {
					timeout_ms = 500,
					lsp_fallback = true,
				},
			})

			vim.keymap.set("n", "<leader>rl", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end)
		end,
	},
	{ "MunifTanjim/nui.nvim" },
	{ "VonHeikemen/fine-cmdline.nvim" },
	{ "github/copilot.vim" },
	-- { "terrortylor/nvim-comment" },
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = { "tokyonight.nvim", "nvim-tree/nvim-web-devicons" },
	},
	{ "sontungexpt/url-open" },
	{ "filipdutescu/renamer.nvim" },
	{ "akinsho/toggleterm.nvim" },
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{ "kylechui/nvim-surround" },
	{ "windwp/nvim-autopairs" },
	{ "jose-elias-alvarez/typescript.nvim" },
	{ "windwp/nvim-ts-autotag", dependencies = "nvim-treesitter" },
	{ "christoomey/vim-tmux-navigator" },
	{ "folke/trouble.nvim" },
	{ "stevearc/conform.nvim" },
}

require("lazy").setup(plugins, {})
