#!/bin/sh

music_dir="$HOME/Music"
if ! [ -f $XDG_CONFIG_HOME/ncmpcpp/previews ]; then
    mkdir -p $XDG_CONFIG_HOME/ncmpcpp/previews  
fi
previewdir="$XDG_CONFIG_HOME/ncmpcpp/previews"
filename="$(mpc --format "$music_dir"/%file% current)"
previewname="$previewdir/$(mpc --format %album% current | base64).png"

[ -e "$previewname" ] || ffmpeg -y -i "$filename" -an -vf scale=128:128 "$previewname" > /dev/null 2>&1

notify-send -r 27072 "Now Playing" "$(mpc --format '%title% \n%artist% - %album%' current)" -i "$previewname"
