-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Autostart Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

require("config/defaults")

-- Autostart wiki https://wiki.hyprland.org/Configuring/Keywords/#executing

hl.on("hyprland.start", function ()
    -- hl.exec_cmd("dms run &")
    hl.exec_cmd("uwsm app -- fcitx5 -d")
    
    -- Using Lua's raw string brackets [[ ]] to safely comment out complex bash commands without string escaping headaches:
    -- hl.exec_cmd([[bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob & disown" &]])
    
    hl.exec_cmd("uwsm app -- gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("uwsm app -- /usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("blueman-applet")
    
    -- Idle configuration
    hl.exec_cmd("uwsm app -- $idlehandler")
    hl.exec_cmd("openrgb --startminimized -p ~/.config/OpenRGB/great-wave.orp &")
    hl.exec_cmd("killall nm-applet")
end)