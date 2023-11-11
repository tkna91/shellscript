#!/bin/bash

lockfile=/var/run/user/$UID/dpms-off.lock
if [ ! -e "$lockfile" ] ; then
    swaymsg "output * dpms off" &&
    swaymsg -t get_outputs | jq -r '.[] | .name' > "$lockfile"
else
    while read -r i ; do
        swaymsg output "$i" dpms on
    done < "$lockfile"
    rm -f "$lockfile"
fi
