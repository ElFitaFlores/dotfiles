#!/usr/bin/env bash

# Determine current theme mode
mode_file="$HOME/.cache/.theme_mode"
touch $mode_file
if [ "$(cat $mode_file)" = "light" ]; then
    next_mode="dark"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
else
    next_mode="light"
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
fi

update_theme_mode() {
    echo "$next_mode" > "$mode_file"
}

set_waybar_style() {
    waybar_style_link="$HOME/.config/waybar/theme.css"
    style_file="$next_mode.css"

    pkill waybar

    if [ -n "$style_file" ]; then
        ln -sf "$style_file" "$waybar_style_link"
    else
        echo "Style file not found for $next_mode theme."
    fi

    waybar > /dev/null 2>&1 &
}

update_theme_mode
set_waybar_style

exit 0
