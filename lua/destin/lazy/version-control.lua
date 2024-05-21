return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "rhysd/git-messenger.vim",
    "lewis6991/gitsigns.nvim",
    "akinsho/git-conflict.nvim"
  },
  config = function()
    require("git-conflict").setup({})
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    })

    vim.g.git_messenger_floating_win_opts = {
      border = 'single'
    }

    vim.keymap.set("n", "<leader>gh", "<cmd>GitMessenger<cr>", { silent = true, desc = "[H]over" })
    vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { silent = true, desc = "[L]azy" })

    -- https://github.com/akinsho/git-conflict.nvim?tab=readme-ov-file#commands
    -- https://github.com/akinsho/git-conflict.nvim?tab=readme-ov-file#mappings
  end,
}

--[[
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },

--]]
--
