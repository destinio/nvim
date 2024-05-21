return {
  "rhysd/git-messenger.vim",
  config = function()
    vim.g.git_messenger_floating_win_opts = {
      border = 'single'
    }

    vim.keymap.set("n", "<leader>gh", "<cmd>GitMessenger<cr>", { silent = true, desc = "[H]over" })
  end
}
