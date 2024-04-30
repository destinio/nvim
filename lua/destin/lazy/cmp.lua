-- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
-- https://github.com/hrsh7th


return { -- Autocompletion
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = {
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").load({})
            require("luasnip.loaders.from_lua").lazy_load({
              paths = { "~/.config/nvim/snippets" },
            })

            local luasnip = require("luasnip")
            local types = require("luasnip.util.types")

            luasnip.setup({
              updateevents = "TextChanged,TextChangedI",
              enable_autosnippets = true,
              -- https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#ext_opts
              ext_opts = {
                active = -- this is the table actually passed to `nvim_buf_set_extmark`.
                {
                  -- highlight the text inside the node red.
                  hl_group = "DiagnosticError",
                },
                visited = {
                  hl_group = "DiagnosticInfo",
                },
                unvisited = {
                  hl_group = "DiagnosticOk",
                },
                [types.choiceNode] = {
                  active = {
                    virt_text = { { "< LS Choice", "DiagnosticWarn" } },
                  },
                },
              },
            })
            -- Filetype mappings
            luasnip.filetype_extend("typescriptreact", { "typescript", "javascriptreact", "javascript" })
            luasnip.filetype_extend("typescript", { "javascript" })
            luasnip.filetype_extend("javascriptreact", { "javascript" })

            local silent_opts = {
              silent = true,
            }

            -- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
            -- vim.keymap.set("i", "<C-k>", function()
            --   luasnip.expand()
            -- end, silent_opts)
            vim.keymap.set({ "i", "s" }, "<C-l>", function()
              luasnip.jump(1)
            end, silent_opts)
            vim.keymap.set({ "i", "s" }, "<C-h>", function()
              luasnip.jump(-1)
            end, silent_opts)
            -- select next choice
            vim.keymap.set({ "i", "s" }, "<C-e>", function()
              if luasnip.choice_active() then
                luasnip.change_choice(1)
              end
            end, silent_opts)
          end,
        },
      },
    },
    "onsails/lspkind.nvim",
    "lukas-reineke/cmp-under-comparator",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lua",
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      window = {
        completion = {
          border = "rounded",
          winhighlight = "Normal:CmpNormal",
        },
        documentation = {
          border = "rounded",
          winhighlight = "Normal:CmpDocNormal",
        }
      },
      formatting = {
        format = lspkind.cmp_format({
          with_text = true,
          ellipsis_char = "…",
          show_labelDetails = true,
          mode = "symbol",
          menu = ({
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            luasnip = "[LS]",
            nvim_lua = "[api]",
            path = "[path]",
            emoji = "[emo]",
            cmdline = "[cmd]",
          }),
        })
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      --- Ignore LSP preselect items as it causes snippets to be skipped.
      preselect = cmp.PreselectMode.None,
      completion = { completeopt = "menu,menuone,noinsert" },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete({}),           -- open completion menu
        ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Confirm the completion menu
        -- ['<C-e>'] = cmp.mapping.close(), -- Close the completion menu

        ["<C-n>"] = cmp.mapping.select_next_item(), -- Navigate the completion menu down
        ["<C-p>"] = cmp.mapping.select_prev_item(), -- Navigate the completion menu up

        ["<C-f>"] = cmp.mapping.scroll_docs(4),     -- Scroll the documentation window
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),    -- Scroll the documentation window
      }),
      enabled = function()
        local context = require("cmp.config.context")
        -- Completion is always allowed in command mode
        if vim.api.nvim_get_mode().mode == "c" then
          return true
        end

        -- Disable completion in prompt buffers (e.g. Telescope)
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
          return false
        end

        -- Disable completion when editing comments
        return not (context.in_treesitter_capture("comment") or context.in_syntax_group("Comment"))
      end,

      -- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
      sources = {
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "emoji" },
        { name = 'buffer' },
        { name = "cmdline" },
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          require("cmp-under-comparator").under,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
    })
  end,
}
