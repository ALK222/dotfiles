#!/usr/bin/env bash
set -euo pipefail

VIRTUAL_PREFIX="VIRTUAL"

# Get all monitors currently active
for MON in $(hyprctl monitors -j | jq -r '.[].name'); do
    # Remove only virtual monitors
    if [[ "$MON" == ${VIRTUAL_PREFIX}* ]]; then
        echo "Removing virtual monitor $MON"
        hyprctl output remove "$MON"
    fi
done

echo "All virtual monitors removed."

hyprctl reload

echo "Monitor configuration restored (config file reloaded)."
