return {
  "Kasama/nvim-custom-diagnostic-highlight",
  config = function()
    require("nvim-custom-diagnostic-highlight").setup({})

    vim.diagnostic.config({
      float = { border = "rounded" },
    })
  end,
}
