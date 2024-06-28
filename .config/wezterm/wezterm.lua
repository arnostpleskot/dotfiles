local wezterm = require("wezterm")

local theme_dark = require("lua/rose-pine")
local theme_light = require("lua/rose-pine-dawn")

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
	return "Dark"
	-- if wezterm.gui then
	-- 	return wezterm.gui.get_appearance()
	-- end
	-- return "Dark"
end

local function get_scheme()
	if get_appearance():find("Dark") then
		return theme_dark.colors()
	else
		return theme_light.colors()
	end
end

return {
	-- window_background_opacity = 0.8,
	-- GPU acceleration -------------
	front_end = "WebGpu",
	webgpu_power_preference = "HighPerformance",
	-- Hypelinks --------------------
	hyperlink_rules = {
		-- Matches: a URL in parens: (URL)
		{
			regex = "\\((\\w+://\\S+)\\)",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in brackets: [URL]
		{
			regex = "\\[(\\w+://\\S+)\\]",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in curly braces: {URL}
		{
			regex = "\\{(\\w+://\\S+)\\}",
			format = "$1",
			highlight = 1,
		},
		-- Matches: a URL in angle brackets: <URL>
		{
			regex = "<(\\w+://\\S+)>",
			format = "$1",
			highlight = 1,
		},
		-- Then handle URLs not wrapped in brackets
		{
			regex = "\\b\\w+://\\S+[)/a-zA-Z0-9-]+",
			format = "$0",
		},
	},
	-- Font -------------------------
	font = wezterm.font_with_fallback({
		-- { family = "Operator Mono Lig", harfbuzz_features = { "calt=1", "clig=1", "liga=1" } },
		{ family = "JetBrains Mono", weight = "Medium", harfbuzz_features = { "calt=1", "clig=1", "liga=1" } },
		{ family = "Terminus", weight = "Bold" },
		"Noto Sans Mono",
		"Noto Color Emoji",
	}),
	font_size = 14,

	-- Colors -------------------------
	colors = get_scheme(),

	-- Tab bar -------------------------
	tab_max_width = 42,
	tab_bar_at_bottom = true,
	hide_tab_bar_if_only_one_tab = true,
	use_fancy_tab_bar = false,

	-- Misc -------------------------
	window_decorations = "RESIZE",
	warn_about_missing_glyphs = false,

	-- Keys -------------------------
	keys = {
		-- Send custom sequence on C-m and C-i to overcame legacy compatibility when they are handled as Tab and Enter
		{
			key = "m",
			mods = "CTRL",
			action = wezterm.action({ SendString = "\x1b[5;30012~" }),
		},
		{
			key = "i",
			mods = "CTRL",
			action = wezterm.action({ SendString = "\x1b[5;30013~" }),
		},
	},
}
