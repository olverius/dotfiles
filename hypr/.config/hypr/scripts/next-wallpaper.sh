#!/usr/bin/env bash
# Cycle to the next wallpaper in ~/Pictures/wallpapers with a smooth awww transition
dir="$HOME/Pictures/wallpapers"
link="$HOME/.cache/current-wallpaper"

mapfile -t walls < <(find "$dir" -maxdepth 1 -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.webp' -o -iname '*.gif' \) | sort)
[ ${#walls[@]} -eq 0 ] && exit 1

current=$(readlink "$link")
next="${walls[0]}"
for i in "${!walls[@]}"; do
  if [ "${walls[$i]}" = "$current" ]; then
    next="${walls[$(((i + 1) % ${#walls[@]}))]}"
    break
  fi
done

awww img "$next" \
  --transition-type fade \
  --transition-pos top-right \
  --transition-duration 0.8 \
  --transition-fps 60

ln -sf "$next" "$link"
