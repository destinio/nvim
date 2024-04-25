return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  dependencies = {
    "lewis6991/gitsigns.nvim",
    { "akinsho/git-conflict.nvim", version = "*" },
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

    -- Lazy Git
    vim.keymap.set("n", "gl", ":LazyGit<cr>", { desc = "[L]azy [G]it" })

    -- https://github.com/akinsho/git-conflict.nvim?tab=readme-ov-file#commands
    -- https://github.com/akinsho/git-conflict.nvim?tab=readme-ov-file#mappings
  end,
}
