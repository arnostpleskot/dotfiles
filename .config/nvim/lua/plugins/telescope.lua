return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader><space>",
        "<cmd>Telescope oldfiles cwd_only=true<cr>",
        desc = "Recent files in cwd",
      },
      {
        "<leader><C-space>",
        "<cmd>Telescope oldfiles<cr>",
        desc = "Recent files",
      },
    },
  },
}
