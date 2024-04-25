return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = false,
      auto_session_suppress_dirs = { "~/", "~/Downloads", "/", "~/Desktop", "~/Documents/" },
    })

    -- Sessions
    vim.keymap.set("n", "<leader>wr", "<cmd>SessionRestore<cr>", { desc = "" })
    vim.keymap.set("n", "<leader>ws", "<cmd>SessionSave<cr>", { desc = "" })
  end,
}
