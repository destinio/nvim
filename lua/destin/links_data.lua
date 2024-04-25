local M = {}

local links_data = {
  { title = "repos", url = "github.com/destinio?tab=repositories" },
}

M.get_links = function()
  return links_data
end

return M
