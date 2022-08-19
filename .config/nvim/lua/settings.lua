local theme = require("theme")

vim.g.mapleader = " "
vim.g.python3_host_prog = "~/.asdf/shims/python3"
vim.g.python_host_prog = "~/.asdf/shims/python2"

vim.cmd([[set fcs=eob:\ ]])
vim.cmd([[filetype plugin indent on]])

local options = {
  termguicolors = true,
  fileencoding = "utf-8",
  backup = false,
  swapfile = false,
  hlsearch = false,
  incsearch = true,
  showmode = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  scrolloff = 8,
  sidescrolloff = 8,
  smartindent = true,
  signcolumn = "yes",
  hidden = true,
  ignorecase = true,
  timeoutlen = 1000,
  shiftround = true,
  smartcase = true,
  splitbelow = true,
  splitright = true,
  number = true,
  relativenumber = true,
  cursorline = true,
  mouse = "a",
  cmdheight = 1,
  undodir = "/tmp/.nvim/undodir",
  undofile = true,
  pumheight = 10,
  laststatus = 3,
  updatetime = 250,
  background = "dark",
  wrap = false,
  showtabline = 0,
  list = true,
  spelllang = "en",
  spell = true,
}

local globalVariables = {
  session_directory = "/tmp/.nvim/session",
  session_autoload = "no",
  session_autosave = "no",
  session_command_aliases = 1,
  loaded_netrw = 1,
}

vim.opt.shortmess:append("c")
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
vim.opt.clipboard:append("unnamedplus")

for key, value in pairs(options) do
  vim.opt[key] = value
end

for key, value in pairs(globalVariables) do
  vim.api.nvim_set_var(key, value)
end

theme.init()
