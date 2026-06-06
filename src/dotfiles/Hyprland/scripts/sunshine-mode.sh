#!/bin/bash
TEMP_FILE="/tmp/hypr_monitor_state.json"

case "$1" in
    start)
        # 1. Save current state
        hyprctl monitors -j > "$TEMP_FILE"
        
        WIDTH=${SUNSHINE_CLIENT_WIDTH:-2560}
        HEIGHT=${SUNSHINE_CLIENT_HEIGHT:-1440}
        FPS=${SUNSHINE_CLIENT_FPS:-60}
        
        # 2. Create the Headless output FIRST
        hyprctl output create headless
        hyprctl keyword monitor "HEADLESS-1,${WIDTH}x${HEIGHT}@${FPS},0x0,1"
        
        # 3. CRITICAL: Wait for the virtual monitor to "exist" in the eyes of the GPU
        sleep 2
        
        # 4. Disable others
        MONITORS=$(jq -r '.[].name' "$TEMP_FILE")
        for m in $MONITORS; do
            hyprctl keyword monitor "$m,disable"
        done
        
        # 5. Force focus to the only remaining screen
        hyprctl dispatch focusmonitor HEADLESS-1
        ;;
        
    stop)
        if [ -f "$TEMP_FILE" ]; then
            jq -c '.[]' "$TEMP_FILE" | while read -r monitor; do
                NAME=$(echo "$monitor" | jq -r '.name')
                W=$(echo "$monitor" | jq -r '.width')
                H=$(echo "$monitor" | jq -r '.height')
                R=$(echo "$monitor" | jq -r '.refreshRate')
                X=$(echo "$monitor" | jq -r '.x')
                Y=$(echo "$monitor" | jq -r '.y')
                S=$(echo "$monitor" | jq -r '.scale')
                T=$(echo "$monitor" | jq -r '.transform')
                hyprctl keyword monitor "$NAME,${W}x${H}@${R},${X}x${Y},${S},transform,${T}"
            done
            rm "$TEMP_FILE"
        fi
        sleep 1
        
        # 3. Find and remove ALL headless outputs
        # This looks for any monitor name starting with "HEADLESS"
        ALL_HEADLESS=$(hyprctl monitors -j | jq -r '.[].name | select(startswith("HEADLESS"))')
        
        for h in $ALL_HEADLESS; do
            hyprctl output remove "$h"
        done
        ;;
esac
