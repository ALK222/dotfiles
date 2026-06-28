#!/bin/bash
TEMP_FILE="/tmp/hypr_monitor_state.json"

# Check for dry run argument
DRY_PREFIX=""
if [[ "$2" == "dry" || "$2" == "--dry-run" ]]; then
    DRY_PREFIX="echo [DRY RUN]"
fi

case "$1" in
    start)
        hyprctl -j monitors > "$TEMP_FILE"
        
        WIDTH=${SUNSHINE_CLIENT_WIDTH:-2560}
        HEIGHT=${SUNSHINE_CLIENT_HEIGHT:-1440}
        FPS=${SUNSHINE_CLIENT_FPS:-60}
        
        # 1. Create the Headless output
        hyprctl output create headless
        
        # 2. Configure monitor via table (as requested by error)
        # Assuming the structure requires name, res, position, etc. as keys
        hyprctl eval "hl.monitor({output = 'HEADLESS-1', mode = '${WIDTH}x${HEIGHT}@${FPS}', position = '0x0', scale = 1})"
        
        sleep 2
        
        # 3. Disable others
        # Note: 'output' is often 'name' in JSON, ensure your jq query matches your 'hyprctl -j monitors' output
        MONITORS=$(jq -r '.[].name' "$TEMP_FILE") 
        for m in $MONITORS; do
            hyprctl eval "hl.monitor({output = '$m', disabled = true})"
        done
        
        # 4. Corrected Dispatch
        hyprctl dispatch 'focusmonitor, "HEADLESS-1"'
        ;;
        
    stop)
        if [ -f "$TEMP_FILE" ]; then
            # Re-enable monitors from file
            jq -c '.[]' "$TEMP_FILE" | while read -r monitor; do
                NAME=$(echo "$monitor" | jq -r '.name')
                hyprctl eval "hl.monitor({output = '$NAME', disabled = false})"
            done
            rm "$TEMP_FILE"
        fi
        
        sleep 1
        
        # Remove all headless
        ALL_HEADLESS=$(hyprctl -j monitors | jq -r '.[].name | select(startswith("HEADLESS"))')
        for h in $ALL_HEADLESS; do
            hyprctl output remove "$h"
        done
        ;;
    *)
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac