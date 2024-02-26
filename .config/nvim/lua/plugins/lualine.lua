return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    local Util = require("lazyvim.util")
    local icons = require("lazyvim.config").icons

    opts.options.component_separators = "|"
    opts.options.section_separators = { left = "", right = "" }

    opts.options.disabled_filetypes.winbar = { "dashboard", "alpha", "starter", "edgy", "neo-tree", "aerial", "noice" }

    opts.sections.lualine_c = {
      {
        "diagnostics",
        symbols = {
          error = icons.diagnostics.Error,
          warn = icons.diagnostics.Warn,
          info = icons.diagnostics.Info,
          hint = icons.diagnostics.Hint,
        },
      },
    }

    opts.winbar = {
      lualine_a = {
        {
          "filetype",
          icon_only = true,
          separator = "",
          padding = { left = 1, right = 0 },
        },
        "filename",
      },
      lualine_c = {
        Util.lualine.root_dir(),
        { Util.lualine.pretty_path() },
        {
          function()
            return require("nvim-navic").get_location()
          end,
          cond = function()
            return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
          end,
        },
      },
    }

    opts.inactive_winbar = {
      lualine_c = {
        Util.lualine.root_dir(),
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { Util.lualine.pretty_path() },
      },
    }
  end,
}
