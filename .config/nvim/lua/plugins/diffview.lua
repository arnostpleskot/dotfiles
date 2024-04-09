return {
  { "sindrets/diffview.nvim" },
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local diffview = {
        action = "DiffviewOpen",
        desc = " Diffview",
        icon = "󰃸 ",
        key = "d",
      }

      diffview.desc = diffview.desc .. string.rep(" ", 43 - #diffview.desc)
      diffview.key_format = "  %s"

      table.insert(opts.config.center, 7, diffview)
    end,
  },
}
