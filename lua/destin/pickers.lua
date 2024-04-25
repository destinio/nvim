local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local lang = require "destin.islang"
local utils = require "destin.utils"

local d_links = require "destin.links_data"

local links = function(opts)
  opts = opts or {}
  local link_data = d_links.get_links()

  pickers.new(opts, {
    prompt_title = "IS Links",
    finder = finders.new_table {
      results = link_data,
      entry_maker = function(entry)
        local ordinal_value = tostring(entry.title) .. " " .. tostring(entry.url)
        return {
          value = entry.url,
          display = ordinal_value,
          ordinal = ordinal_value,
        }
      end,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)

        local selection = action_state.get_selected_entry()

        utils.open_url(selection.value)
      end)
      return true
    end,
  }):find()
end


local langs = function(opts)
  opts = opts or {}
  local data = lang.trans_lang_data()

  pickers.new(opts, {
    prompt_title = "IS Translations",
    finder = finders.new_table {
      results = data,
      entry_maker = function(entry)
        local max_display_length = 80
        local entry_1_str = tostring(entry[1])
        local entry_2_str = tostring(entry[2])
        local ordinal_value = entry_1_str .. " " .. entry_2_str
        local display_value = entry_1_str .. "\t::\t" .. entry_2_str

        if #display_value > max_display_length then
          display_value = display_value:sub(1, max_display_length) .. "..."
        end

        return {
          value = entry[1],
          display = display_value,
          ordinal = ordinal_value,
        }
      end,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)

        local selection = action_state.get_selected_entry()
        vim.fn.setreg('+', selection.value)
        print('Copied to clipboard: ' .. selection.value)
      end)
      return true
    end,
  }):find()
end

vim.api.nvim_create_user_command("Langit", function()
  langs({})
end, {})

vim.api.nvim_create_user_command("Linkit", function()
  links({})
end, {})

vim.keymap.set("n", "<leader>sl", ":Langit<CR>",
  { noremap = true, silent = true, desc = "[L]anguage Translations" })

vim.keymap.set("n", "<leader>sk", ":Linkit<CR>",
  { noremap = true, silent = true, desc = "Lin[k]s" })
