return {
  "LukasPietzschmann/boo.nvim",
  config = function()
    local boo = require("boo")
    vim.keymap.set("n", "K", function()
      boo.boo()
    end, {})
  end,
}
