return {
  "jackMort/ChatGPT.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    -- for better key https://youtu.be/7k0KZsheLP4?si=VwRoKWkIraFDxGwj&t=192
    require("chatgpt").setup()

    -- CHAT GPT
    vim.keymap.set("n", "<leader>cc", "<cmd>ChatGPT<CR>", { desc = "[C]hat" })
    vim.keymap.set("n", "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>", { desc = "[E]dit With Inst.." })
    vim.keymap.set("n", "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>", { desc = "E[x]plain Code" })
    vim.keymap.set("n", "<leader>co", "<cmd>ChatGPTRun optimize_code<CR>", { desc = "[O]ptimize Code" })
    vim.keymap.set("n", "<leader>cg", "<cmd>ChatGPTRun  grammar_correction<CR>", { desc = "[G]rammer Check" })
    vim.keymap.set("n", "<leader>cs", "<cmd>ChatGPTRun summarize<CR>", { desc = "[S]ummerize" })
    vim.keymap.set("n", "<leader>cp", "<cmd>ChatGPTCompleteCode<cr>", { desc = "Com[p]lete Code" })
  end,
}
