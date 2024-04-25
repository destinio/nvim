local M = {}

M.P = function(v)
  print(vim.inspect(v))
end

M.open_url = function(text)
  local url = string.gsub(text, "'", "\\'")
  os.execute("echo '" .. url .. "' | url | xargs open")
  print("done")
end

-- flatten_table: Recursively flatten nested tables
M.flatten_table = function(tbl, key_prefix)
  local flattened = {}

  for key, value in pairs(tbl) do
    local new_key = key_prefix and key_prefix .. "." .. key or key

    if type(value) == "table" then
      -- Recursively flatten nested tables
      local nested_flattened = M.flatten_table(value, new_key)
      for k, v in ipairs(nested_flattened) do
        table.insert(flattened, v)
      end
    else
      -- Add key-value pair to flattened table
      table.insert(flattened, { new_key, value })
    end
  end

  return flattened
end

return M
