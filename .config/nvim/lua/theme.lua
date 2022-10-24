local tokyonight = require("utils").safeLoad("tokyonight")
local _M = {
	colors = {},
}
_M.init = function()
	if tokyonight then
		vim.cmd("colorscheme tokyonight")
	end
end

return _M
