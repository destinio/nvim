local v = vim

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

v.keymap.set("n", "<leader>a", mark.add_file)
v.keymap.set("n", "<leader>e", ui.toggle_quick_menu)
