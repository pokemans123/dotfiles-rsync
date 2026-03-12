#!/usr/bin/env bash
DIR="$HOME/Pictures/Screenshots"
mkdir -p "$DIR"
TEMP="/tmp/screenshot-$(date '+%Y%m%d-%H%M%S').png"
FILE="$DIR/$(date '+%Y%m%d-%H%M%S').png"

# Capture to temp file
grim -g "$(slurp)" "$TEMP"

# Annotate with satty
satty --filename "$TEMP" --output-filename "$FILE" --copy-command wl-copy

# Clean up temp file
rm "$TEMP"

