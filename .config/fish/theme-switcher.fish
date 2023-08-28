#!/usr/bin/env fish

set LIGHTTHEME "Catppuccin Latte"
set DARKTHEME "Catppuccin Frappe"
set TMUX_DARK "@catppuccin_flavour 'frappe'"
set TMUX_LIGHT "@catppuccin_flavour 'latte'"
set TMUXCONF $HOME/.config/tmux/tmux.conf

echo Setting theme to $argv[1]

switch $argv[1]
    case light
        yes | fish_config theme save $LIGHTTHEME
        sed -i "s/$TMUX_DARK/$TMUX_LIGHT/" $TMUXCONF
        notify-send "Theme changed to light"
    case dark
        echo a
        yes | fish_config theme save $DARKTHEME
        echo b
        sed -i "s/$TMUX_LIGHT/$TMUX_DARK/" $TMUXCONF
        notify-send "Theme changed to dark"
    case "*"
        echo "Invalid theme option. Usage: theme-switcher.fish [light|dark]"
end


tmux source-file $TMUXCONF
