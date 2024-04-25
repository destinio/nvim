return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
    -- your debuggers
    "leoluz/nvim-dap-go",
  },
  config = function()
    -- :help dap-adapter
    -- :help dap-configuration
    -- https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/

    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua#L6
      ensure_installed = {
        "delve",
        "python",
        "bash",
        "chrome",
        "php",
        "js",
      },
    })

    local node_path = os.getenv("XDG_CONFIG_HOME") or os.getenv("HOME") .. "/.config"

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set("n", "<leader>Ds", dap.continue, { desc = "Debug: Start/Continue" })
    vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
    vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debug: Step Over" })
    vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debug: Step Out" })
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Debug: Set Breakpoint" })

    -- :help nvim-dap-ui
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    })

    vim.keymap.set("n", "<leader>Dt", dapui.toggle, { desc = "Debug: See last session result." })

    -- Install golang specific config
    require("dap-go").setup()

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close
  end,
}
