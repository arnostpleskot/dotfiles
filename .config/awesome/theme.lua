local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gears = require("gears")
local dpi = xresources.apply_dpi
local themes_path = gears.filesystem.get_themes_dir()
local custom_theme_path = gears.filesystem.get_configuration_dir() .. "theme/"
local naughty = require("naughty")

local theme =  {}
local gruvbox = {
    bg = "#282828",
    fg = "#ebdbb2",
    gray = "#a89984",
    blue = "#458588",
    green = "#98971a",
    red = "#fb4934",
    purple = "#d16286"
}
gears.wallpaper.centered(os.getenv("HOME") ..  "/Pictures/wallhaven-q2293q.png")

theme.font = "CaskaydiaCove Nerd Font Mono 10"

theme.bg_normal     = gruvbox.bg
theme.bg_focus      = gruvbox.blue
theme.bg_urgent     = gruvbox.red
theme.bg_minimize   = gruvbox.gray
theme.bg_systray    = gruvbox.bg

theme.fg_normal     = gruvbox.gray
theme.fg_focus      = gruvbox.fg
theme.fg_urgent     = gruvbox.fg
theme.fg_minimize   = gruvbox.fg

theme.useless_gap   = dpi(2)
theme.border_width  = dpi(1)
theme.border_normal = gruvbox.bg
theme.border_focus  = gruvbox.green
theme.border_marked = gruvbox.red

theme.systray_icon_spacing = dpi(4)

theme.layout_tileleft  = themes_path .. "default/layouts/tileleftw.png"
theme.layout_tile  = themes_path .. "default/layouts/tilew.png"
theme.layout_magnifier = themes_path .. "default/layouts/magnifierw.png"
theme.layout_floating  = themes_path .. "default/layouts/floatingw.png"

theme.awesome_icon = custom_theme_path .. "arch-icon.png"
theme.icon = custom_theme_path .. "arch-icon.png"

theme.menu_height = dpi(20)
theme.menu_width  = dpi(200)

theme.taglist_font = "CaskaydiaCove Nerd Font Mono 16"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_focus
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Generate Awesome icon:
-- theme.awesome_icon = theme_assets.awesome_icon(
--     theme.menu_height, gruvbox.bg, gruvbox.blue
-- )

theme.icon_theme = nil

return theme
