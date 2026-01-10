-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

local shortcuts = require("telescope-live-grep-args.shortcuts")
map("n", "<leader>fs", shortcuts.grep_word_under_cursor, { desc = "Live Grep World" })

map("n", "<C-i>", "^", { desc = "Go to the start of the line", remap = true })
map("n", "<C-a>", "$", { desc = "Go to the end of the line", remap = true })

map("i", "jj", "<esc>", { desc = "Switch to normal mode", silent = true })
map("i", "jk", "<esc>", { desc = "Switch to normal mode", silent = true })

-- Keymap toggle to temporarily hide all diagnostics:
map("n", "<leader>dh", function ()
  local config = vim.diagnostic.config()

  if config ~= nil then
    local vt = config.virtual_text
    vim.diagnostic.config({
        virtual_text = not vt,
        underline = not vt,
        signs = not vt,
    })
  end
end, { desc = "Toggle diagnostics visibility" })
