#!/usr/bin/env bash
dir="$HOME/Pictures/wallpapers"
link="$HOME/.cache/current-wallpaper"

mapfile -t walls < <(find "$dir" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' \) | sort)
[ ${#walls[@]} -eq 0 ] && exit 1

current=$(readlink "$link")
next="${walls[0]}"
for i in "${!walls[@]}"; do
    if [ "${walls[$i]}" = "$current" ]; then
        next="${walls[$(( (i + 1) % ${#walls[@]} ))]}"
        break
    fi
done

hyprctl hyprpaper wallpaper ",$next"
ln -sf "$next" "$link"
