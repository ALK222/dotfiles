-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Autostart Configuration                 ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

require("config/defaults")

-- Autostart wiki https://wiki.hyprland.org/Configuring/Keywords/#executing

hl.on("hyprland.start", function ()

    -- Credentials & Authentication (Migrated to native Hypr Polkit)
    hl.exec_cmd("uwsm app -- gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("uwsm app -- swayosd-server")

    -- Hardware & Bluetooth Applets
    hl.exec_cmd("uwsm app -- blueman-applet")
    hl.exec_cmd("openrgb --startminimized -p ~/.config/OpenRGB/great-wave.orp &")
    hl.exec_cmd("sleep 2 && killall nm-applet")

    hl.exec_cmd("dms run &")
    

    -- Unused / Cleaned up DMS & Legacy hooks
    -- hl.exec_cmd("uwsm app -- $idlehandler")
    -- hl.exec_cmd([[bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob & disown" &]])
end)
