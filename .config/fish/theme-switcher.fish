#!/usr/bin/env fish

set THEME_LIGHT "Rosé Pine Dawn"
set THEME_DARK "Rosé Pine"
set THEME_BAT_LIGHT gruvbox-light
set THEME_BAT_DARK gruvbox-dark

set BATCONF $HOME/.config/bat/config
set GITCONF $HOME/.gitconfig

echo Setting theme to $argv[1]

switch $argv[1]
    case light
        yes | fish_config theme save $THEME_LIGHT
        sed -i "s/$THEME_BAT_DARK/$THEME_BAT_LIGHT/" $BATCONF
        sed -i "s/light = false/light = true/" $GITCONF

        flatpak override --user --env=GTK_THEME=$THEME_FLATPAK_LIGHT
    case dark
        yes | fish_config theme save $THEME_DARK
        sed -i "s/$THEME_BAT_LIGHT/$THEME_BAT_DARK/" $BATCONF
        sed -i "s/light = true/light = false/" $GITCONF
    case "*"
        echo "Invalid theme option. Usage: theme-switcher.fish [light|dark]"
end
