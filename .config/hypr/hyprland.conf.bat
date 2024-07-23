
$terminal = wezterm

env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia

cursor {
	no_hardware_cursors = true
}

exec-once = swaync
exec-once = /usr/lib/polkit-kde-authentication-agent-1
exec-once = $terminal
exec-once = nm-applet
exec-once = waybar
exec-once = hyprpaper

$mainMod = SUPER

bind = $mainMod, T, exec, $terminal
bind = $mainMod SHIFT, E, exit
