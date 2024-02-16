require("bufferline").setup{
  options = {
    indicator = {
      icon = " "
    },
    tab_size = 0,
    max_name_length = 24,
    offsets = {
      {
        filetype = "NvimTree",
        text = " Files",
        highlight = "StatusLine",
        text_align = "left"
      }
    },
    modified_icon = "",
  }
}
