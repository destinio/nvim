return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    -- https://github.com/goolord/alpha-nvim/discussions/16
    -- https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f#file-x-setup-alpha-lua
    -- https://github.com/dharmx/nvim/blob/9489b4acfdd729f0420b8c2b1b37d75a3a85831a/lua/tables/banners.lua
    -- https://github.com/nvimdev/dashboard-nvim/wiki/Ascii-Header-Text

    local alpha = require("alpha")
    local theme = require("destin.themes.dash")

    local function footer()
      local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
      return datetime .. "   v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
    end

    -- theme.section.header.val = {} -- change header text

    theme.section.header.opts.hl = "DiagnosticWarn"

    theme.section.buttons.val = {
      theme.button("so", "󰱼 Recent", "<cmd>Telescope oldfiles<CR>"),
      theme.button("q", "󰅙 Quit", "<cmd>qa<CR>"),
      theme.button("nn", "󰥨 Explorer", "<cmd>Neotree toggle<CR>"),
      theme.button("sf", "󰱼 Files", "<cmd>Telescope find_files<CR>"),
      theme.button("wr", "󰦛 Restore", "<cmd>SessionRestore<cr>"),
      theme.button("sga", "󰷊 Grep", "<cmd>Telescope live_grep<CR>"),
      theme.button("cc", "󰻞 Chat", "<cmd>ChatGPT<CR>"),
      theme.button("sp", " Projects", "<cmd>Telescope projects<CR>"),
      theme.button("sh", "󰋖 Help", "<cmd>Telescope help_tags<CR>"),
    }

    theme.section.footer.opts.hl = "Constant"

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local count = (math.floor(stats.startuptime * 100) / 100)
        theme.section.footer.val = {
          "󱐌 " .. stats.count .. " plugins loaded in " .. count .. " ms",
          " ",
          footer(),
        }
        pcall(vim.cmd.AlphaRedraw)
      end,
    })

    alpha.setup(theme.opts)

    vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
  end,
}
