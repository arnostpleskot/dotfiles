local ok, wk = pcall(require, "which-key")

if not ok then
    return
end

local options = {
  prefix = "",
  silent = true,
  noremap = true,
  nowait = true,
}

local optionsN = {
  mode = "n",
  prefix = "",
  silent = true,
  noremap = true,
  nowait = true,
}

local optionsV = {
  mode = "v",
  prefix = "",
  silent = true,
  noremap = true,
  nowait = true,
}

wk.register({
   -- [[Illuminate]]
  ["<Tab>"] = { "<cmd>lua require'illuminate'.next_reference{wrap=true}<cr>", "[ILLUMINATE] Next reference" },
  ["<S-Tab>"] = {
    "<cmd>lua require'illuminate'.next_reference{reverse=true,wrap=true}<cr>",
    "[ILLUMINATE] Next reference",
  },

   -- [[ Telescope ]]
  ["<leader>f"] = {
    name = "[TELESCOPE]",
    f = { "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "[TELESCOPE] Find File" },
    g = { "<cmd>Telescope live_grep<cr>", "[TELESCOPE] Find File by grep" },
    b = { "<cmd>Telescope buffers<cr>", "[TELESCOPE] Find buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "[TELESCOPE] Help tags" },
    m = { "<cmd>Telescope marks<cr>", "[TELESCOPE] Marks" },
    o = { "<cmd>Telescope oldfiles<cr>", "[TELESCOPE] Recent" },
  },

  ["<C-Space>"] = { "<cmd>Telescope frecency<cr>", "[TELESCOPE] Frecency" },

  -- [[ Gitsigns ]]
  ["<leader>g"] = {
      name = "[GITSIGNS]",
      s = { "<cmd>Gitsigns toggle_signs<cr>", "[GITSIGNS] Toggle signs" },
      h = { "<cmd>Gitsigns preview_hunk<cr>", "[GITSIGNS] Preview hunk" },
      d = { "<cmd>Gitsigns diffthis<cr>", "[GITSIGNS] Show diff" },
  },

  -- [[ UI ]]
  ["<leader>u"] = {
    name = "[UI]",
    u = { "<cmd>UndotreeToggle<cr>", "[UI] Undotree" },
    a = { "<cmd>Alpha<cr>", "[UI] Alpha" },
  },

  -- [[ Window ]]
  ["<leader>w"] = {
    name = "[Window]",
    ["/"] = { "<cmd>vsplit<CR>", "[Window] split vertical"  },
    ["-"] = { "<cmd>split<CR>", "[Window] split horizontal" },
    h = { "<C-w>K", "[Window] vertical to horizontal" },
    v = { "<C-w>H", "[Window] horizontal to vertical" },
  },
}, optionsN)

wk.register({
  ["<"] = { "<gv", "Shift to left" },
  [">"] = { ">gv", "Shift to right" },
}, optionsV)

wk.register({
  -- Colemak
  -- movement
  m = { "h", "move Left" },
  n = { "gj", "move Down" },
  e = { "gk", "move Up" },
  i = { "l", "move Right" },
  t = { "i", "(t)ype - replaces (i)nsert" },
  T = { "I", "(T)ype - replaces (I)nsert" },
  E = { "e", "end of word - replaces (e)nd" },
  h = { "n", "next match - replaces (n)ext" },
  k = { "N", "previous match - replaces (N) prev" },
  M = { "m|", "mark - replaces (m)ark" },

  -- page up/down
  ["<A-e>"] = { "<C-b>H", "page up" },
  ["<A-n>"] = { "<C-f>", "page down" },

  -- switching panes
  ["<C-m>"] = { "<C-w>h", "switch pane to left" },
  ["<C-n>"] = { "<C-w>j", "switch pane to down" },
  ["<C-e>"] = { "<C-w>k", "switch pane to up" },
  ["<C-i>"] = { "<C-w>l", "switch pane to right" },

  -- moving on line
  ["<A-m>"] = { "g^", "move cursor to start of line" },
  ["<A-i>"] = { "g$", "move cursor to end of line" },

  -- global shortcuts
  ["<C-q>"] = { "<cmd>q<CR>", "close window" },
  ["<C-s>"] = { "<cmd>wa<CR>", "save all app" },
}, options)

wk.setup {}
