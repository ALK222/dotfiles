-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Variables Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

require("config/color")

-- Auto-translated variables from dms/colors.conf
local primary     = "rgb(eec148)"
local outline     = "rgb(919191)"
local error_color = "rgb(ffb4ab)"

hl.config({
    -- https://wiki.hyprland.org/Configuring/Variables/#general
    general = {
        gaps_in = 4,
        gaps_out = 4,
        border_size = 2,
        
        -- Translated static color variables
        ["col.active_border"] = primary,
        ["col.inactive_border"] = outline,
        layout = "dwindle", -- master|dwindle

        -- https://wiki.hyprland.org/Configuring/Variables/#snap
        snap = {
            enabled = true,
        },
    },

    -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
    -- ┃          Decoration Block (CSS Glassmorphism Injection)    ┃
    -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
    decoration = {
        rounding = 20,

        -- MODERN HYPRLAND SHADOW SYNTAX:
        shadow = {
            enabled = true,
            range = 32,
            render_power = 3,
            color = "rgba(0000001a)", -- Soft 10% dark outer glow
        },

        blur = {
            enabled = true,
            size = 5,       
            passes = 3,      
            xray = false,    
            vibrancy = 0.40, 
        }
    },

    -- https://wiki.hyprland.org/Configuring/Variables/#group
    group = {
        -- Translated color scheme layout definitions
        ["col.border_active"] = primary,
        ["col.border_inactive"] = outline,
        ["col.border_locked_active"] = error_color,
        ["col.border_locked_inactive"] = outline,

        -- https://wiki.hyprland.org/Configuring/Variables/#groupbar
        groupbar = {
            font_family = "Fira Sans",
            text_color = surface, -- Kept solid so the text remains sharp and readable!
            ["col.active"] = primary,
            ["col.inactive"] = outline,
            ["col.locked_active"] = error_color,
            ["col.locked_inactive"] = outline,
        },
    },

    -- https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
        font_family = "Fira Sans",
        splash_font_family = "Fira Sans",
        disable_hyprland_logo = true,
        ["col.splash"] = inverse_on_surface,
        background_color = background_glass, -- Smooth, translucent root workspace layer
        enable_swallow = true,
        swallow_regex = "^(nautilus|nemo|thunar|btrfs-assistant.)$",
        focus_on_activate = true,
        vrr = 2,
    },

    -- https://wiki.hyprland.org/Configuring/Variables/#render
    render = {
        direct_scanout = true,
    },

    -- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    dwindle = {
        special_scale_factor = 0.8,
        -- pseudotile = true,
        preserve_split = true,
    },

    -- See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    master = {
        new_status = "master",
        special_scale_factor = 0.8,
    },
})

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Gestures                                 ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Custom standalone gesture binds (commented out per your layout request)
-- If you want to reactivate these, use hl.gesture() like this:

-- hl.gesture(4, "horizontal", "workspace")
-- hl.gesture(3, "down", "close")
-- hl.gesture(3, "up", "fullscreen")
-- hl.gesture(3, "left", "float")