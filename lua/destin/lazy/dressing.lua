-- https://github.com/stevearc/dressing.nvim?tab=readme-ov-file#configuration
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  config = function()
    require("dressing").setup({})
  end,
}
