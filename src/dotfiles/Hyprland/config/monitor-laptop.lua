-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Monitor Configuration                   ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Preferred display target rule utilizing a 1.6 fractional scaling value
hl.monitor({
    output = "",            -- Empty string targets any unconfigured display
    mode = "preferred",     -- Automatically chooses native resolution/refresh rate
    position = "auto",      -- Automatically positions next to existing monitors
    vrr = 1,             -- Enable Variable Refresh Rate (VRR) if supported
    scale = 1.6,            -- 1.6 Fractional scaling
})

-- Core Rendering & System Subsystems
hl.config({
    xwayland = {
        force_zero_scaling = true, -- Unscale XWayland apps to prevent blurry scaling
    },
})

-- Electron-based apps use X11 as default, auto forces native Wayland detection
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- Adjust GDK_SCALE accordingly if you prefer integer scaling (uncomment to activate)
-- hl.env({
--     GDK_SCALE = "2"
-- })

-- Force Steam Desktop UI scaling to match your 1.6 monitor profile
hl.env("STEAM_FORCE_DESKTOPUI_SCALING","1.6")