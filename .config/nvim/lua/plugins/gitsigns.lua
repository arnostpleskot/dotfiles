return {
  {
    "lewis6991/gitsigns.nvim",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      opts.current_line_blame = true
    end,
  },
}
