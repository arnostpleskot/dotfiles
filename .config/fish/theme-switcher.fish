#!/usr/bin/env fish

set THEME_FISH_LIGHT "catppuccin-latte"
set THEME_FISH_DARK "catppuccin-mocha"
set THEME_BAT_LIGHT "catppuccin-latte"
set THEME_BAT_DARK "catppuccin-mocha"
set THEME_ZELLIJ_LIGHT "catppuccin-latte"
set THEME_ZELLIJ_DARK "catppuccin-mocha"

set BATCONF $HOME/.config/bat/config
set GITCONF $HOME/.gitconfig
set ZELLIJCONF $HOME/.config/zellij/config.kdl

echo Setting theme to $argv[1]

switch $argv[1]
    case light
        yes | fish_config theme save $THEME_FISH_LIGHT
        sed -i "s/$THEME_BAT_DARK/$THEME_BAT_LIGHT/" $BATCONF
        sed -i "s/light = false/light = true/" $GITCONF
        sed -i "s/$THEME_TMUX_DARK/$THEME_TMUX_LIGHT/" $TMUXCONF
        sed -i "s/theme \"$THEME_ZELLIJ_DARK\"/theme \"$THEME_ZELLIJ_LIGHT\"/" $ZELLIJCONF
    case dark
        yes | fish_config theme save $THEME_FISH_DARK
        sed -i "s/$THEME_BAT_LIGHT/$THEME_BAT_DARK/" $BATCONF
        sed -i "s/light = true/light = false/" $GITCONF
        sed -i "s/$THEME_TMUX_LIGHT/$THEME_TMUX_DARK/" $TMUXCONF
        sed -i "s/theme \"$THEME_ZELLIJ_LIGHT\"/theme \"$THEME_ZELLIJ_DARK\"/" $ZELLIJCONF
    case "*"
        echo "Invalid theme option. Usage: theme-switcher.fish [light|dark]"
end
