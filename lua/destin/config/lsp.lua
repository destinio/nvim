vim.opt.signcolumn = "yes"
local lsp = require("lsp-zero")
local ls = require("luasnip")

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

-- snippet directory
require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"rust_analyzer",
	"gopls",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local ends_with = function(str, ending)
	return ending == "" or str:sub(-#ending) == ending
end

lsp.configure("tsserver", {
	on_attach = function(client)
		client.handlers["textDocument/definition"] = function(_, result, ...)
			-- Filter out certain paths from the results that are 99% of the time
			-- false positive results for my use case. If I explicitly jump to
			-- them, go there, otherwise ignore them.
			if vim.tbl_islist(result) then
				local ignored_paths = {
					"react/index.d.ts",
				}

				for key, value in ipairs(result) do
					for _, ignored_path in pairs(ignored_paths) do
						-- If an ignored path is the first result, keep it as it's
						-- likely the intended path.
						if key ~= 1 and ends_with(value.targetUri, ignored_path) then
							table.remove(result, key)
						end
					end
				end
			end

			-- Defer to the built-in handler after filtering the results
			vim.lsp.handlers["textDocument/definition"](_, result, ...)
		end
	end,
})

lsp.nvim_workspace({
	library = vim.api.nvim_get_runtime_file("", true),
})

local cmp = require("cmp")

local cmp_select = { behavior = cmp.SelectBehavior.Select }

local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
	["<cr>"] = cmp.mapping.confirm({ select = true }),
	["<esc>"] = cmp.mapping.abort(),
	["<C-space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = true,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	-- if client.name == "eslint" then
	--     vim.cmd.LspStop('eslint')
	--     return
	-- end

	-- https://neovim.io/doc/user/lsp.html#vim.lsp.buf.implementation():~:text=Lua%20module%3A-,vim.lsp.buf,-lsp%2Dbuf
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

	vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

	vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

	vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
	vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
end)

-- LuaSnip
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

vim.keymap.set({ "i", "s" }, "<c-n>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })

-- jump lunsnip prev
vim.keymap.set({ "i", "s" }, "<c-p>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- jump lunsnip list
vim.keymap.set({ "i" }, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice()
	end
end, { silent = true })

-- source new snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/destin/plugs/lsp.lua<CR>")

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})

mason_null_ls.setup({
	-- list of formatters & linters for mason to install
	ensure_installed = {
		"prettier", -- ts/js formatter
		"stylua", -- lua formatter
		"eslint_d", -- ts/js linter
		"markdownlint",
		"cspell",
		"codespell",
	},
	-- auto-install configured formatters & linters (with null-ls)
	automatic_installation = true,
})

require("fidget").setup()
