#!/bin/bash
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
    waybar_styles="$HOME/.config/waybar/style"
    waybar_style_link="$HOME/.config/waybar/theme.css"
    style_file="$next_mode.css"

    pkill waybar

    if [ -n "$style_file" ]; then
        ln -sf "$style_file" "$waybar_style_link"
    else
        echo "Style file not found for $next_mode theme."
    fi

    waybar &
}

update_theme_mode
set_waybar_style

exit 0
