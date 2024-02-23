local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function()
	vim.diagnostic.config({
		virtual_text = true,
	})
end)

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"rust_analyzer",
		"intelephense",
		"gopls",
		"bashls",
		"vimls",
		"jsonls",
		"html",
		"tailwindcss",
		"pylsp",
		"pyright",
	},

	handlers = {
		lsp_zero.default_setup,
		lua_ls = function()
			local lua_opts = lsp_zero.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

lsp_zero.configure("intelephense", {
	on_attach = function()
		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
})

lsp_zero.configure("pylsp", {
	on_attach = function()
		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
})

lsp_zero.configure("gopls", {
	on_attach = function()
		vim.diagnostic.config({
			virtual_text = false,
		})
	end,
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "treesitter" },
		{ name = "intelephense" },
		{ name = "gopls" },
		{ name = "python" },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "buffer", keyword_length = 3 },
	},
	formatting = lsp_zero.cmp_format(),
	mapping = cmp.mapping.preset.insert({
		["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
		["<esc>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-Space>"] = cmp.mapping.complete(),
	}),
})
