-- https://github.com/j-hui/fidget.nvim?tab=readme-ov-file#options
return {
  "j-hui/fidget.nvim",
  config = function()
    require("fidget").setup({
      notification = {
        window = {
          winblend = 0,
          border = "rounded",
        },
      },
    })
  end,
}
