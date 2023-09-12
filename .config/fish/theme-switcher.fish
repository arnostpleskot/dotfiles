#!/usr/bin/env fish

set THEME_LIGHT "Catppuccin Latte"
set THEME_DARK "Catppuccin Frappe"
set THEME_TMUX_DARK "@catppuccin_flavour 'frappe'"
set THEME_TMUX_LIGHT "@catppuccin_flavour 'latte'"
set THEME_FLATPAK_LIGHT Catppuccin-Latte-Standard-Lavender-Light
set THEME_FLATPAK_DARK Catppuccin-Frappe-Standard-Lavender-Dark
set THEME_BAT_LIGHT Catppuccin-latte
set THEME_BAT_DARK Catppuccin-frappe

set BATCONF $HOME/.config/bat/config
set TMUXCONF $HOME/.config/tmux/tmux.conf

echo Setting theme to $argv[1]

switch $argv[1]
    case light
        yes | fish_config theme save $THEME_LIGHT
        sed -i "s/$THEME_TMUX_DARK/$THEME_TMUX_LIGHT/" $TMUXCONF
        sed -i "s/$THEME_BAT_DARK/$THEME_BAT_LIGHT/" $BATCONF
        flatpak override --user --env=GTK_THEME=$THEME_FLATPAK_LIGHT
        notify-send "Light theme" "Don't forget to restart flatpak apps"
    case dark
        echo a
        yes | fish_config theme save $THEME_DARK
        echo b
        sed -i "s/$THEME_TMUX_LIGHT/$THEME_TMUX_DARK/" $TMUXCONF
        sed -i "s/$THEME_BAT_LIGHT/$THEME_BAT_DARK/" $BATCONF
        flatpak override --user --env=GTK_THEME=$THEME_FLATPAK_DARK
        notify-send "Dark theme" "Don't forget to restart flatpak apps"
    case "*"
        echo "Invalid theme option. Usage: theme-switcher.fish [light|dark]"
end


tmux source-file $TMUXCONF
