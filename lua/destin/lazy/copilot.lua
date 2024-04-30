return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    -- vim.cmd("Copilot disable")
    vim.keymap.set("n", "<leader>c+", function()
      vim.cmd("Copilot enable")
      require("notify")("Copilot enabled", "info", {
        title = "Copilot",
      })
    end, { desc = "Copilot enable" })

    vim.keymap.set("n", "<leader>c-", function()
      vim.cmd("Copilot disable")
      require("notify")("Copilot disabled", "error", {
        title = "Copilot",
      })
    end, { desc = "Copilot disable" })

    vim.keymap.set("i", "<C-j>", "<Plug>(copilot-accept-line)")
    vim.keymap.set("i", "<C-k>", "<Plug>(copilot-accept-word)")
    vim.keymap.set("i", "<C-i>", "<Plug>(copilot-suggest)")
    -- vim.keymap.set("i", "<C-j>", "<Plug>(copilot-next)")
    -- vim.keymap.set("i", "<C-k>", "<Plug>(copilot-previous)")
  end,
}
