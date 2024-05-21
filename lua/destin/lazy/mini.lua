return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.ai").setup({ n_lines = 500 })

    require("mini.cursorword").setup()
    require("mini.pairs").setup()
    require("mini.surround").setup()

    local miniclue = require("mini.clue")
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = "n", keys = "<space>" },
        { mode = "x", keys = "<space>" },

        -- Built-in completion
        { mode = "i", keys = "<C-x>" },

        -- `g` key
        { mode = "n", keys = "g" },
        { mode = "x", keys = "g" },

        -- `d` key
        { mode = "n", keys = "d" },
        { mode = "x", keys = "d" },

        -- `c` key
        { mode = "n", keys = "c" },
        { mode = "x", keys = "c" },

        -- `]` key
        { mode = "n", keys = "]" },
        { mode = "x", keys = "]" },

        -- `[` key
        { mode = "n", keys = "[" },
        { mode = "x", keys = "[" },

        -- `n` key
        { mode = "n", keys = "n" },
        { mode = "x", keys = "n" },

        -- `m` key
        { mode = "n", keys = "m" },
        { mode = "x", keys = "m" },

        -- Marks
        { mode = "n", keys = "'" },
        { mode = "n", keys = "`" },
        { mode = "x", keys = "'" },
        { mode = "x", keys = "`" },

        -- Registers
        { mode = "n", keys = '"' },
        { mode = "x", keys = '"' },
        { mode = "i", keys = "<C-r>" },
        { mode = "c", keys = "<C-r>" },

        -- Window commands
        { mode = "n", keys = "<C-w>" },

        -- `z` key
        { mode = "n", keys = "z" },
        { mode = "x", keys = "z" },
      },

      window = {
        delay = 500,
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        -- miniclue.gen_clues.g(), -- to mand. confliction with my maps
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
        { mode = "n", keys = "d",          desc = "[D]elete" },
        { mode = "n", keys = "c",          desc = "[C]hange" },
        { mode = "n", keys = "g",          desc = "[G]o To" },
        { mode = "n", keys = "m",          desc = "[M]ark" },
        { mode = "n", keys = "`",          desc = "[M]arks" },
        { mode = "n", keys = "[",          desc = "Previous" },
        { mode = "n", keys = "]",          desc = "Next" },
        { mode = "n", keys = "<leader>n",  desc = "[N]eo Tree" },
        { mode = "n", keys = "<leader>d",  desc = "[D]iagnostics" },
        { mode = "n", keys = "<leader>c",  desc = "[C]hat GPT" },
        { mode = "n", keys = "<leader>s",  desc = "[S]earch" },
        { mode = "n", keys = "<leader>o",  desc = "Search [O]ld" },
        { mode = "n", keys = "<leader>a",  desc = "[A]dd" },
        { mode = "n", keys = "<leader>t",  desc = "[T]rouble" },
        { mode = "n", keys = "<leader>l",  desc = "[L]ight" },
        { mode = "n", keys = "<leader>g",  desc = "[G]it" },

        { mode = "n", keys = "<leader>sg", desc = "[S]earch [G]rep" },
      },
    })
  end,
}
