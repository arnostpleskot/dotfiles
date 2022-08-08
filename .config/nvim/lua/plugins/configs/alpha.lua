local ok, alpha = pcall(require, "alpha")

if ok then
	local dashboard = require("alpha.themes.dashboard")

	local function button(sc, txt, keybind, keybind_opts)
		local b = dashboard.button(sc, txt, keybind, keybind_opts)
		b.opts.hl = "DashboardShortCut"
		b.opts.hl_shortcut = "DashboardHeader"
		return b
	end

	dashboard.section.buttons.val = {
		button("SPC f f", "  Find File", "<cmd>Telescope find_files<cr>"),
		button("SPC f o", "  Recents", "<cmd>Telescope oldfiles only_cwd=true<cr>"),
		button("SPC f g", "  Find Word", "<cmd>Telescope live_grep<cr>"),
		button("SPC f m", "  Bookmarks", "<cmd>Telescope marks<cr>"),
		button("SPC f c", "  Git Changes", "<cmd>Telescope git_status<cr>"),
	}

	alpha.setup(dashboard.opts)
end
