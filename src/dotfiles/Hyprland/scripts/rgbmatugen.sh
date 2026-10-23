#!/usr/bin/env bash

PROFILE_FILE="$HOME/.config/OpenRGB/matugen.orp"

if [ -f "$PROFILE_FILE" ]; then
    # Extract hex color (stripping # if needed by OpenRGB CLI)
    HEX_COLOR=$(grep "PrimaryColor=" "$PROFILE_FILE" | cut -d'=' -f2 | tr -d '#')
    
    # Extract RGB values directly
    R=$(grep "PrimaryR=" "$PROFILE_FILE" | cut -d'=' -f2)
    G=$(grep "PrimaryG=" "$PROFILE_FILE" | cut -d'=' -f2)
    B=$(grep "PrimaryB=" "$PROFILE_FILE" | cut -d'=' -f2)

    # Set solid color via OpenRGB CLI
    openrgb --color "$HEX_COLOR"
else
    echo "[RGB-Matugen] [ERROR] $PROFILE_FILE not found."
fi
