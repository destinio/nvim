return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local harpoon = require("harpoon")

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():append()
      -- https://github.com/rcarriga/nvim-notify/blob/master/doc/nvim-notify.txt#L21
      require("notify")("File added to Harpoon", "info", {
        title = "Harpoon",
        timeout = 2000,
        render = "compact",
        stages = "static",
      })
    end, { desc = "[H]arpoon" })
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set("n", "[h", function()
      harpoon:list():prev()
    end, { desc = "Harpoon" })
    vim.keymap.set("n", "]h", function()
      harpoon:list():next()
    end, { desc = "Harpoon" })
  end,
}
