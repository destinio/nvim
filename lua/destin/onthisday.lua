-- url: https://today.zenquotes.io/api/<month>/<day>
-- local lang_data = vim.fn.json_decode(vim.fn.readfile(file_path))
--
local M = {}

local function getRandomItem(array)
  local arrayLength = #array -- Get the length of the array

  if arrayLength > 0 then
    local randomIndex = math.random(1, arrayLength) -- Generate a random index
    return array[randomIndex]                       -- Return the random item
  else
    return nil                                      -- Return nil if array is empty
  end
end

local function onthisday(month, day)
  local url = "https://today.zenquotes.io/api/" .. month .. "/" .. day
  local cmd = "curl -s " .. url
  local json = vim.fn.system(cmd)

  -- Check if the command was successful
  if vim.v.shell_error ~= 0 then
    return nil
  end

  local data = vim.fn.json_decode(json)

  if not data then
    return nil
  end

  local events_data = data.data.Events
  local births_data = data.data.Births
  local deaths_data = data.data.Deaths

  local event = string.gsub(getRandomItem(events_data).text, "&#8211;", "-")
  local birth = string.gsub(getRandomItem(births_data).text, "&#8211;", "-")
  local death = string.gsub(getRandomItem(deaths_data).text, "&#8211;", "-")

  local day_data = {
    event = event,
    birth = birth,
    death = death,
  }

  return day_data
end

local function get_day()
  local month = os.date("%m")
  local day = os.date("%d")

  return onthisday(month, day)
end

vim.api.nvim_create_user_command("OnThisDay", function()
  onthisday(os.date("%m"), os.date("%d"))
end, {})

M.get_day = get_day

return M
