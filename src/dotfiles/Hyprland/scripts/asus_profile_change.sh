#!/usr/bin/env bash

# Change Asus performance profile
# asusctl profile -n
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$UID/bus notify-send "Hello" "Test"
