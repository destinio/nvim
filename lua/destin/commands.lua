local augroup = vim.api.nvim_create_augroup
local destingroup = augroup("destinio", {})
local lightgroup = augroup("destinio", {})

local autocmd = vim.api.nvim_create_autocmd

local function get_opts(e, desc)
  desc = desc or "needs description"
  return { buffer = e.buf, desc = desc }
end

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "check time of day and set theme",
  group = lightgroup,
  callback = function() end,
})

autocmd("LspAttach", {
  group = destingroup,
  callback = function(e)
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, get_opts(e, "[d]efinition"))
    vim.keymap.set("n", "gD", function()
      vim.lsp.buf.declaration()
    end, get_opts(e, "[D]eclaration"))

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover,
      {
        border = "single",
        max_width = 80,
        width = 80,
        max_height = 20,
        height = 20,
        title = "Hover (K)",
      }
    )

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, get_opts(e, "Hover"))

    vim.keymap.set("n", "<leader>.", function()
      vim.lsp.buf.code_action()
    end, get_opts(e, "Code Action"))
    vim.keymap.set("n", "gr", function()
      vim.lsp.buf.references()
    end, get_opts(e, "[r]eferences"))
    vim.keymap.set("n", "<leader>rn", function()
      vim.lsp.buf.rename()
    end, get_opts(e, "[R]e[n]ame"))
    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, get_opts(e, "[f]ormat"))
    -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, get_opts(e, ""))
    -- vim.keymap.set("n", "<leader>", function() vim.lsp.buf.workspace_symbol() end, get_opts(e, ""))

    vim.keymap.set("n", "<leader>df", function()
      vim.diagnostic.open_float()
    end, get_opts(e, "[D]io [F]loat"))
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.goto_next()
    end, get_opts(e, "[d]iagnostic"))
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.goto_prev()
    end, get_opts(e, "[d]iagnostic"))
    vim.keymap.set("n", "<leader>dd", vim.diagnostic.setloclist, { desc = "quickfix" })
    vim.keymap.set("n", "<leader>da", vim.diagnostic.setqflist, { desc = "[A]ll Open quickfix" })
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- User Commands
-- nvim_create_user_command({name}, {command}, {*opts})
--
vim.api.nvim_create_user_command("H", function(data)
  if data.args == "" then
    vim.cmd(":vertical help")
  else
    vim.cmd(":vertical help " .. data.args)
  end
end, { bar = true, nargs = '*' })
