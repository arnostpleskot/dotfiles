local wezterm = require("wezterm")

local theme_dark = require("lua/rose-pine")
local theme_light = require("lua/rose-pine-dawn")

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function get_scheme()
	if get_appearance():find("Dark") then
		return theme_dark.colors()
	else
		return theme_light.colors()
	end
end

local SOLID_LEFT_BORDER = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_BORDER = wezterm.nerdfonts.ple_right_half_circle_thick

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.active_pane.title
end

local function countDigits(number)
	-- Convert the number to a string
	local numStr = tostring(number)

	-- Count the number of characters in the string
	return #numStr
end

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
	local scheme = get_scheme()
	local edge_background = scheme.background

	local highlight = scheme.tab_bar.inactive_tab.fg_color
	local background = scheme.tab_bar.inactive_tab.bg_color
	local foreground = scheme.tab_bar.inactive_tab.fg_color

	if tab.is_active then
		highlight = scheme.brights[2]
		background = scheme.tab_bar.active_tab.bg_color
		foreground = scheme.tab_bar.inactive_tab.fg_color
	elseif hover then
		background = scheme.tab_bar.active_tab.bg_color
		foreground = scheme.tab_bar.inactive_tab.fg_color
	end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - countDigits(tab.tab_index) - 5)

	return {
		{ Background = { Color = highlight } },
		{ Foreground = { Color = edge_background } },
		{
			Text = " " .. tab.tab_index .. " ",
		},
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{
			Text = " " .. title,
		},
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_BORDER .. " " },
	}
end)

wezterm.on("update-right-status", function(window)
	local scheme = get_scheme()
	local leader = ""
	if window:leader_is_active() then
		leader = wezterm.format({
			{ Background = { Color = scheme.background } },
			{ Foreground = { Color = scheme.tab_bar.active_tab.bg_color } },
			{ Text = SOLID_LEFT_BORDER },
			{ Background = { Color = scheme.tab_bar.active_tab.bg_color } },
			{ Foreground = { Color = scheme.background } },
			{ Text = "● LEADER" },
		})
	end

	window:set_right_status(leader)
end)

return {
	scrollback_lines = 28000,
	pane_focus_follows_mouse = true,
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
	leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2500 },
	keys = {
		{
			key = "-",
			mods = "LEADER",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "_",
			mods = "LEADER|SHIFT",
			action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "\\",
			mods = "LEADER",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "|",
			mods = "LEADER|SHIFT",
			action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
		},
		{
			key = "w",
			mods = "LEADER",
			action = wezterm.action.CloseCurrentTab({ confirm = true }),
		},
		{
			key = "t",
			mods = "LEADER",
			action = wezterm.action.SpawnTab("DefaultDomain"),
		},
		{
			key = "0",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(0),
		},
		{
			key = "1",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(1),
		},
		{
			key = "2",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(2),
		},
		{
			key = "3",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(3),
		},
		{
			key = "4",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(4),
		},
		{
			key = "5",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(5),
		},
		{
			key = "6",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(6),
		},
		{
			key = "7",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(7),
		},
		{
			key = "8",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(8),
		},
		{
			key = "9",
			mods = "LEADER",
			action = wezterm.action.ActivateTab(9),
		},
		{
			key = "Tab",
			mods = "LEADER",
			action = wezterm.action.ActivateTabRelative(1),
		},
		{
			key = "Tab",
			mods = "LEADER|SHIFT",
			action = wezterm.action.ActivateTabRelative(-1),
		},
		-- Send "CTRL-B" to the terminal when pressing CTRL-B, CTRL-B
		{
			key = "b",
			mods = "LEADER|CTRL",
			action = wezterm.action.SendKey({ key = "b", mods = "CTRL" }),
		},
		-- Switch panes
		{
			key = "M",
			mods = "CTRL",
			action = wezterm.action.ActivatePaneDirection("Left"),
		},
		{
			key = "N",
			mods = "CTRL",
			action = wezterm.action.ActivatePaneDirection("Down"),
		},
		{
			key = "E",
			mods = "CTRL",
			action = wezterm.action.ActivatePaneDirection("Up"),
		},
		{
			key = "I",
			mods = "CTRL",
			action = wezterm.action.ActivatePaneDirection("Right"),
		},
	},
}
