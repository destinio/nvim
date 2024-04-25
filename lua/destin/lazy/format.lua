return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform") -- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gopls", "goimports" },
        python = { "black" },
        bash = { { "shfmt" } },
        sh = { { "shfmt" } },
        html = { { "prettier" } },
        php = { "php-cs-fixer" },
        javascript = { { "eslint", "prettier" } },
        javascriptreact = { "eslint", "prettier" },
        ["javascript.jsx"] = { "eslint", "prettier" },
        typescript = { "eslint", "prettier" },
        ["typescript.tsx"] = { "eslint", "prettier" },
        typescriptreact = { { "eslint", "prettier" } },
        json = { "prettier" },
      },
      format_on_save = function()
        return {
          timeout_ms = 500,
          lsp_fallback = true,
          async = false,
        }
      end,
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      local formattedSuccessfully = conform.format({
        timeout_ms = 500,
        lsp_fallback = true,
        async = false,
      })

      if formattedSuccessfully then
        require("notify")("File formatted!", "info", {
          title = "Comform",
        })
      else
        require("notify")("File not formatted!", "error", {
          title = "Comform",
        })
      end
    end)
  end,
}
