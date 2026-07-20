-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Monitor Configuration                   ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Monitor wiki https://wiki.hyprland.org/Configuring/Monitors/

-- Ultrawide Main Monitor
hl.monitor({
    output = "DP-1",
    mode = "3440x1440@165",
    position = "0x0",
    scale = 1,
    vrr = 3,
})

-- Side Monitor (Rotated/Transformed)
hl.monitor({
    output = "DP-2",
    mode = "1920x1080@60",
    position = "3440x0",
    scale = 1,
    transform = 1, -- Rotate 90 degrees clockwise
})

-- Core Layout & Toolkits Config
hl.config({
    xwayland = {
        force_zero_scaling = true, -- Unscale XWayland
    },
})

-- If you need to scale things like steam etc, please uncomment these lines.
-- Adjust GDK_SCALE accordingly to your liking.
-- hl.env.GDK_SCALE = 1.25
