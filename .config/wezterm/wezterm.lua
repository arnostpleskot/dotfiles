local wezterm = require("wezterm")

return {
	font = wezterm.font_with_fallback({
		-- { family = "Operator Mono Lig", harfbuzz_features = { "calt=1", "clig=1", "liga=1" } },
		{ family = "JetBrains Mono", weight = "Medium", harfbuzz_features = { "calt=1", "clig=1", "liga=1" } },
		{ family = "Terminus", weight = "Bold" },
		"Noto Sans Mono",
		"Noto Color Emoji",
	}),
	font_size = 14,
	-- color_scheme = "tokyonight_moon",
	color_scheme = "Catppuccin Frappe",
	enable_tab_bar = false,
	-- window_decorations = "NONE",
	warn_about_missing_glyphs = false,
}
