local gruvbox = require("utils").safeLoad("gruvbox")
local _M = {
	colors = {},
}

if gruvbox then
	local theme = require("gruvbox.groups").setup()
	_M.colors = {
		bg0 = theme.GruvboxBg0.fg,
		bg0_soft = "#32302f",
		bg0_hard = "#1d2021",
		bg1 = theme.GruvboxBg1.fg,
		bg2 = theme.GruvboxBg2.fg,
		bg3 = theme.GruvboxBg3.fg,
		bg4 = theme.GruvboxBg4.fg,
		fg1 = theme.GruvboxFg1.fg,
		fg2 = theme.GruvboxFg2.fg,
		fg3 = theme.GruvboxFg3.fg,
		fg4 = theme.GruvboxFg4.fg,

		yellow = theme.GruvboxYellow.fg,
		blue = theme.GruvboxBlue.fg,
		aqua = theme.GruvboxAqua.fg,
		orange = theme.GruvboxOrange.fg,
		red = theme.GruvboxRed.fg,
		green = theme.GruvboxGreen.fg,
		purple = theme.GruvboxPurple.fg,
	}
end

_M.init = function()
	if gruvbox then
		vim.o.background = "dark" -- or "light" for light mode

		gruvbox.setup({
			undercurl = true,
			underline = true,
			bold = true,
			italic = true,
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true, -- invert background for search, diffs, statuslines and errors
			contrast = "", -- can be "hard", "soft" or empty string
			overrides = {
				CursorLine = { bg = "#32302f" },
				CursorLineNr = { bg = "#32302f" },
				StatusLine = { bg = _M.colors.bg0 },
				SignColumn = { bg = _M.colors.bg0 },
				StatusLineNC = { bg = _M.colors.bg0 },
				FoldColumn = { bg = _M.colors.bg0 },
				ColorColumn = { bg = _M.colors.bg0 },
				GruvboxRedSign = { bg = _M.colors.bg0 },
				GruvboxGreenSign = { bg = _M.colors.bg0 },
				GruvboxYellowSign = { bg = _M.colors.bg0 },
				GruvboxBlueSign = { bg = _M.colors.bg0 },
				GruvboxPurpleSign = { bg = _M.colors.bg0 },
				GruvboxAquaSign = { bg = _M.colors.bg0 },
				GruvboxOrangeSign = { bg = _M.colors.bg0 },
				TelescopePromptPrefix = { bg = _M.colors.bg1 },
				TelescopePromptNormal = { bg = _M.colors.bg1 },
				TelescopeResultsNormal = { bg = _M.colors.bg0_hard },
				TelescopePreviewNormal = { bg = _M.colors.bg0_soft },
				TelescopePromptBorder = { bg = _M.colors.bg1, fg = _M.colors.bg1 },
				TelescopeResultsBorder = { bg = _M.colors.bg0_hard, fg = _M.colors.bg0_hard },
				TelescopePreviewBorder = { bg = _M.colors.bg0_soft, fg = _M.colors.bg0_soft },
				TelescopePromptTitle = { fg = _M.colors.bg1 },
				TelescopeResultsTitle = { fg = _M.colors.bg0_hard },
				TelescopePreviewTitle = { fg = _M.colors.bg0_soft },
				Pmenu = { bg = _M.colors.bg0_soft },
			},
			dim_inactive = false,
			transparent_mode = false,
		})
		vim.cmd("colorscheme gruvbox")
	end
end

return _M
