return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = "|",
        section_separators = "",
      },
      sections = {
        lualine_a = { {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
        } },

        lualine_b = {},
        lualine_c = {
          {
            "filename",
            path = 4,
            symbols = {
              modified = "[+]", -- Text to show when the file is modified.
              readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "[No Name]", -- Text to show for unnamed buffers.
              newfile = "[New]", -- Text to show for newly created file before first write
            },
          },
        },
        lualine_x = {
          {
            "branch",
            icon = "",
            fmt = function(str)
              return str:sub(1, 30)
            end,
          },
          {
            "filetype",
            colored = true,
            icon_only = false,
            icon = { align = "right" },
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}
