return {
  "yorickpeterse/nvim-pqf",
  config = function()
    require("pqf").setup()

    vim.keymap.set("n", "<leader>dc", ":cclose<cr>", { desc = "[C]lose quickfix list" })
    vim.keymap.set("n", "<leader>do", ":copen<cr>", { desc = "[O]pen quickfix list" })
    vim.keymap.set("n", "<leader>dx", ":cexpr []<cr>", { desc = "Clear quickfix", silent = true })
  end,
}
