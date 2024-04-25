local M = {}

local home = os.getenv("HOME")

local utils = require "destin.utils"

M.trans_lang_data = function()
  local file_path = home .. "/Documents/WA/a2zsync/resources/lang/en.json"
  local lang_data = vim.fn.json_decode(vim.fn.readfile(file_path))

  if type(lang_data) ~= "table" then
    print("Error: Could not load language data")
    return {}
  end

  local data = utils.flatten_table(lang_data) or {}

  return data
end

return M
