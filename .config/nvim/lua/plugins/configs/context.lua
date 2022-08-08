local context = require("utils").safeLoad("treesitter-context")

if context then
  context.setup({})
end
