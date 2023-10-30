#!/bin/bash

file=~/tmp/$(date "+%Y%m%d-%H%M%S")_screenshot.png
grim -g "$(slurp)" - | swappy -f - -o - | pngquant - -o "$file" &&
yad --title="Upload OK?" --text="Upload OK?" --image="dialog-question" --default-cancel &&
curl -F"file=@$file" https://0x0.st | wl-copy -n &&
notify-send --expire-time=3000 "Uploaded and Copied to clipboard." "$(wl-paste)"
mpv --image-display-duration=3 "$(wl-paste)"
