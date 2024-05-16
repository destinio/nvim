return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup()

    vim.keymap.set("n", "<leader>ta", function()
      require("trouble").toggle()
    end, { desc = "[A]ll" })

    vim.keymap.set("n", "<leader>tw", function()
      require("trouble").toggle("workspace_diagnostics")
    end, { desc = "[W]orksace" })

    vim.keymap.set("n", "<leader>tx", function()
      require("trouble").toggle("document_diagnostics")
    end, { desc = "[X] Document" })

    vim.keymap.set("n", "<leader>tq", function()
      require("trouble").toggle("quickfix")
    end, { desc = "[Q]uickfix" })

    vim.keymap.set("n", "<leader>tl", function()
      require("trouble").toggle("loclist")
    end, { desc = "[L]oclist" })

    vim.keymap.set("n", "gR", function()
      require("trouble").toggle("lsp_references")
    end, { desc = "[R]eferences" })
  end,
}
