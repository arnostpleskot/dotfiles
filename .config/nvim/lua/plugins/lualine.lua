-- if true then
--   return {}
-- end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    opts.options.component_separators = "|"
    opts.options.section_separators = { left = "", right = "" }
  end,
}
