local wezterm = require("wezterm")

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "Catppuccin Frappe"
	else
		return "Catppuccin Latte"
	end
end

return {
	font = wezterm.font_with_fallback({
		-- { family = "Operator Mono Lig", harfbuzz_features = { "calt=1", "clig=1", "liga=1" } },
		{ family = "JetBrains Mono", weight = "Medium", harfbuzz_features = { "calt=1", "clig=1", "liga=1" } },
		{ family = "Terminus", weight = "Bold" },
		"Noto Sans Mono",
		"Noto Color Emoji",
	}),
	font_size = 14,
	color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),
	enable_tab_bar = false,
	-- window_decorations = "NONE",
	warn_about_missing_glyphs = false,
}
