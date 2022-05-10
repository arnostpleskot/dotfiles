local colors = require("theme").colors

local bubbles_theme = {
  normal = {
    a = { fg = colors.dark0, bg = colors.light4 },
    b = { fg = colors.light4, bg = colors.dark2 },
    c = { fg = colors.dark0, bg = colors.dark0 },
  },

  insert = { a = { fg = colors.dark0, bg = colors.bright_orange } },
  visual = { a = { fg = colors.dark0, bg = colors.bright_blue } },
  replace = { a = { fg = colors.dark0, bg = colors.bright_aqua } },

  inactive = {
    a = { fg = colors.light4, bg = colors.dark0 },
    b = { fg = colors.light4, bg = colors.dark0 },
    c = { fg = colors.dark0, bg = colors.dark0 },
  },
}

require('lualine').setup {
  options = {
    theme = 'gruvbox',
  },
  sections = {
    lualine_a = {
      { 'mode', right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
    {
    function()
        local msg = "No Active Lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end

        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes

            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = "",
    cond = function()
        return vim.fn.empty(vim.fn.expand "%:t") ~= 1
    end,
    color = { fg = colors.grey9 },
},
    {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " ", hint = " " },
      diagnostics_color = {
        color_error = { fg = colors.bright_red },
        color_warn = { fg = colors.bright_yellow },
        color_info = { fg = colors.bright_blue },
      },
    }},
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
