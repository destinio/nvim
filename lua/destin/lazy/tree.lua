return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua
    require("neo-tree").setup({
      filesystem = {
        -- https://github.com/nvim-neo-tree/neo-tree.nvim/tree/main#:~:text=be%20grouped%20together-,hijack_netrw_behavior,-%3D%20%22open_default
        hijack_netrw_behavior = "disabled",
      },
      window = {
        width = 30,
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = false } },
        },
      },
    })

    -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua#L361
    vim.keymap.set("n", "<leader>nt", ":Neotree toggle<CR>", { desc = "(T)oggle" })
    vim.keymap.set("n", "<leader><leader>", ":Neotree toggle reveal<CR>", { desc = "Open" })

    -- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/lua/neo-tree/defaults.lua#L561
    vim.keymap.set("n", "<leader>ns", ":Neotree git_status action=focus toggle float<CR>", { desc = "Git (S)tatus" })
    vim.keymap.set("n", "<leader>nb", ":Neotree source=buffers action=focus reveal toggle<CR>", { desc = "(B)uffers" })
    vim.keymap.set("n", "<leader>nl", ":Neotree last action=focus<CR>", { desc = "(L)ast" })
    vim.keymap.set("n", "<leader>nd", ":Neotree document_symbols<CR>", { desc = "(D)ocument Symboles" })
  end,
}
