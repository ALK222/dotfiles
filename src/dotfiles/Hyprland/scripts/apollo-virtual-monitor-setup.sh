#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <WIDTHxHEIGHT@REFRESH>"
    echo "Example: $0 1920x1080@144"
    exit 1
fi


MODE="$1"
WIDTH=$(echo "$MODE" | cut -d'x' -f1)
HEIGHT_REFRESH=$(echo "$MODE" | cut -d'x' -f2)
HEIGHT=$(echo "$HEIGHT_REFRESH" | cut -d'@' -f1)
REFRESH=$(echo "$HEIGHT_REFRESH" | cut -d'@' -f2)


# Pick the next available virtual monitor name
VIRTUAL_INDEX=1
# while hyprctl monitors -j | jq -r '.[].name' | grep -q "^VIRTUAL$VIRTUAL_INDEX$"; do
#     VIRTUAL_INDEX=$((VIRTUAL_INDEX+1))
# done
VIRTUAL_NAME="VIRTUAL$VIRTUAL_INDEX"

# Configure resolution, refresh, scale
echo "Configuring virtual monitor $VIRTUAL_NAME"
hyprctl keyword monitor "$VIRTUAL_NAME,${WIDTH}x${HEIGHT}@${REFRESH},10000x10000,1"

# Create headless virtual monitor
echo "Creating headless virtual monitor $VIRTUAL_NAME"
hyprctl output create headless "$VIRTUAL_NAME"


hyprctl dispatch focusmonitor "$VIRTUAL_NAME"



# Disable all other monitors
echo "Disabling all other monitors"
for MON in $(hyprctl monitors -j | jq -r '.[].name'); do
    if [[ "$MON" != "$VIRTUAL_NAME" ]]; then
        echo "Disabling monitor $MON"
        hyprctl keyword monitor "$MON,disabled"
    fi
done
