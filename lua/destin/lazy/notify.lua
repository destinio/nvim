return {
  "rcarriga/nvim-notify",
  config = function()
    require("notify").setup({
      timeout = 1400,
      render = "compact",
      stages = "static",
      background_colour = "None",
    })

    vim.notify = require("notify")
  end,
}
