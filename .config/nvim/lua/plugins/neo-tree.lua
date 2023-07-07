return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
        mappings = {
          ["E"] = "toggle_auto_expand_width",
          ["M"] = "move",
          ["e"] = false,
          ["n"] = false,
          ["m"] = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" and node:is_expanded() then
              require("neo-tree.sources.filesystem").toggle_directory(state, node)
            else
              require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
            end
          end,
          ["i"] = function(state)
            local node = state.tree:get_node()
            if node.type == "directory" then
              if not node:is_expanded() then
                require("neo-tree.sources.filesystem").toggle_directory(state, node)
              elseif node:has_children() then
                require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
              end
            end
          end,
        },
      },
    },
  },
}
