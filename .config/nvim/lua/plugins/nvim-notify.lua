return {
  {
    "rcarriga/nvim-notify",
    keys = {
      {
        "<leader>uN",
        function()
          require("notify").dismiss({ silent = true, pending = true })
        end,
        desc = "Dismiss all Notifications",
      },
      {
        "<leader>un",
        "<cmd>Telescope notify<cr>",
        desc = "Notifications",
      },
    },
    -- config = function(_, opts)
    --   local job = require("plenary.job")
    --   job
    --     :new({
    --       command = "curl",
    --       args = { "https://vtip.43z.one" },
    --       on_exit = function(j, exit_code)
    --         local res = table.concat(j:result())
    --         if exit_code ~= 0 then
    --           res = "Error fetching tip: " .. res
    --         end
    --         require("notify")(res, "info", { title = "Vim Tip" })
    --       end,
    --     })
    --     :start()
    -- end,
  },
}
