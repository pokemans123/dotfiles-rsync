#!/usr/bin/env bash
DIR="$HOME/Pictures/wallpapers"
IMAGE_PICKER_CONFIG="$HOME/.config/rofi/image-picker.rasi"
FILES=$(find -L "$DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \))
ROFI_MENU=""

while IFS= read -r WALLPAPER_PATH; do
  WALLPAPER_NAME=$(basename "$WALLPAPER_PATH")
  ROFI_MENU+="${WALLPAPER_NAME}\0icon\x1f${WALLPAPER_PATH}\n"
done <<<"$FILES"

CHOSEN_WALLPAPER=$(echo -e "$ROFI_MENU" | rofi -dmenu -i \
  -p "Select Wallpaper:" \
  -theme "$IMAGE_PICKER_CONFIG" \
  -markup-rows \
  -show-icons)

[ -z "$CHOSEN_WALLPAPER" ] && exit 0

if [[ "$CHOSEN_WALLPAPER" == *$'\x1f'* ]]; then
  WALLPAPER=$(echo -e "$CHOSEN_WALLPAPER" | cut -d $'\x1f' -f2)
else
  WALLPAPER="$DIR/$CHOSEN_WALLPAPER"
fi

[ -z "$WALLPAPER" ] && exit 0

swww img "$WALLPAPER" --transition-type grow --transition-duration 1.0
echo "$WALLPAPER" >"$HOME/.config/hypr/.wallpaper_current"



