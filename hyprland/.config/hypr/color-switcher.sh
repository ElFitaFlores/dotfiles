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

update_theme_mode

exit 0
