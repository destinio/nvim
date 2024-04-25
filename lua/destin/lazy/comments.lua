return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  lazy = false,
  config = function()
    local comment = require("Comment")
    local ts_context_comment = require("ts_context_commentstring.integrations.comment_nvim")

    comment.setup({
      pre_hook = ts_context_comment.create_pre_hook(),
    })
  end,
}
