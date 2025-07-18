#!/usr/bin/env bash

# Determine current theme mode
mode_file="$HOME/.cache/.theme_mode"
touch $mode_file
if [ "$(cat $mode_file)" = "light" ]; then
    next_mode="dark"
else
    next_mode="light"
fi

change_gnome_theme() {
    dconf write /org/gnome/desktop/interface/color-scheme "'prefer-$next_mode'"
}

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

set_wofi_style() {
    local path="$HOME/.config/wofi"
    local style_link="$HOME/.config/wofi/style.css"
    local style_file="$next_mode.css"

    if [ -n "$style_file" ]; then
	rm -f $path/style.css
	cat $path/$next_mode.css $path/theme.css > $path/style.css
    else
        echo "Style file not found for $next_mode theme."
    fi
}

set_hyprlock_style() {
    local path="$HOME/.config/hypr"
    local style_link="$path/style.conf"
    local style_file="$path/$next_mode.conf"
    
    echo $style_file 

    if [ -n "$style_file" ]; then
       	ln -sf $style_file $style_link
    else
        echo "Style file not found for $next_mode theme."
    fi
}

update_theme_mode
change_gnome_theme
set_waybar_style
set_wofi_style
set_hyprlock_style

exit 0
