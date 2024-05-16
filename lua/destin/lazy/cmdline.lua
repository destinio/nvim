-- https://github.com/vonheikemen/fine-cmdline.nvim
-- https://github.com/vonheikemen/fine-cmdline.nvim?tab=readme-ov-file#configuration
return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {
    { 'MunifTanjim/nui.nvim' }
  },
  config = function()
    require('fine-cmdline').setup({
      popup = {
        position = {
          row = '20%',
        },
      }
    })
  end,
  keys = {
  }
}
