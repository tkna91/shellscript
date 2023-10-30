#!/bin/bash
lang=${1:-eng}
img=$(mktemp -u --suffix=.png)
grim -g "$(slurp)" "$img" &&
tesseract -l "$lang" "$img" stdout > "$img.txt" &&
foot --app-id=ocr nvim "$img.txt" &&
wl-copy < "$img.txt" &&
notify-send -t 3000 'OCR Copied!'
