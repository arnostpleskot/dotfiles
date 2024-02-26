-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local Util = require("lazyvim.util")

map("n", "<C-s>", "<cmd>wa<cr>", { desc = "Save all" })
map("n", "<leader>fP", "<cmd>let @+=expand('%')<cr>", { desc = "Copy file path to clipboard" })

-- Colemak
-- better up/down
map("n", "n", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "e", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("n", "m", "<Left>", { silent = true })
map("n", "i", "<Right>", { silent = true })
map("v", "n", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("v", "e", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map("v", "m", "<Left>", { silent = true })
map("v", "i", "<Right>", { silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-m>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-n>", "<C-w>j", { desc = "Go to lower window" })
map("n", "<C-e>", "<C-w>k", { desc = "Go to upper window" })
map("n", "<C-i>", "<C-w>l", { desc = "Go to right window" })

-- Move Lines
map("n", "<A-n>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-e>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-n>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-e>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-n>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-e>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
if Util.has("bufferline.nvim") then
  map("n", "<S-m>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
  map("n", "<S-i>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
else
  map("n", "<S-m>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
  map("n", "<S-i>", "<cmd>bnext<cr>", { desc = "Next buffer" })
end

-- Remap i(nsert) to t(ype)
map("n", "t", "i")
map("n", "T", "I")

-- Search remap
map("n", "k", "N", { desc = "Find previous" })
map("n", "h", "n", { desc = "Find next" })

-- move half page up/down
map("n", "<C-l>", "<C-u>zz", { desc = "Move half page up" })
map("n", "<C-h>", "<C-d>zz", { desc = "Move half page down" })
