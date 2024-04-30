-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings
-- https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md
--
return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  config = function()
    local ts = require("telescope")
    local tsc = require("telescope.config")
    local actions = require("telescope.actions")
    local harpoon = require("harpoon")
    local builtin = require("telescope.builtin")

    ts.setup({
      --  All the info you're looking for is in `:help telescope.setup()`
      defaults = {
        file_ignore_patterns = { "node_modules", ".git", "*.snap.*", "__snapshots__" },
        sorting_strategy = "ascending",
        layout_strategy = "vertical",
        results_title = false,
        prompt_title = false,
        preview = false,
        mappings = {
          i = {
            ["C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          },
        },
        path_display = {
          shorten = {
            len = 4,
            exclude = { -3, -2, -1 },
          },
        },
        layout_config = {
          vertical = { width = 0.7, height = 0.8, prompt_position = "top" },
        },
      },
      pickers = {
        git_status = {
          preview = true,
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      },
    })

    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
          .new({}, {
            prompt_title = "Harpoon",
            finder = require("telescope.finders").new_table({
              results = file_paths,
            }),
            -- previewer = tsc.file_previewer({}),
            -- sorter = tsc.generic_sorter({}),
          })
          :find()
    end

    -- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    -- 	{ desc = "Open harpoon window" })
    vim.keymap.set("n", "<leader>sh", function()
      toggle_telescope(harpoon:list())
    end, { desc = "[H]arpoon" })
    -- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#pickers
    -- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings
    vim.keymap.set("n", "<leader>o", builtin.oldfiles, { desc = "[O]ld Files" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[A]ll" })
    vim.keymap.set("n", "<leader>sg", builtin.git_files, { desc = "Git [F]iles" })
    vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[B]uffers" })
    vim.keymap.set("n", "<leader>sm", builtin.marks, { desc = "[M]arks" })
    vim.keymap.set("n", "<leader>s?", builtin.help_tags, { desc = "[?] I need Help" })
    vim.keymap.set("n", "<leader>sq", builtin.quickfix, { desc = "[Q]uickfix" })
    vim.keymap.set("n", "<leader>sr", builtin.registers, { desc = "[R]egisters" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[K]eymaps" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[D]iagnostics" })
    vim.keymap.set("n", "<leader>ss", builtin.resume, { desc = "Re[S]ume" })
    vim.keymap.set("n", "<leader>st", builtin.treesitter, { desc = "[T]ree Sitter" })
    vim.keymap.set("n", "<leader>sp", "<cmd>Telescope projects<cr>", { desc = "[P]rojects" })
    vim.keymap.set("n", "<leader>sn", function()
      builtin.find_files({ cwd = vim.fn.stdpath("config") })
    end, { desc = "[N]eovim files" })
    vim.keymap.set("n", "<leader>sga", builtin.live_grep, { desc = "[A]ll" })
    vim.keymap.set("n", "<leader>sgu", builtin.grep_string, { desc = "[U]nder cursor)" })

    vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "[I]mplementations" })
    vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { desc = "[T]ype Definitions" })

    pcall(ts.load_extension, "fzf")
    pcall(ts.load_extension, "ui-select")
    pcall(ts.load_extension, "projects")
  end,
}
