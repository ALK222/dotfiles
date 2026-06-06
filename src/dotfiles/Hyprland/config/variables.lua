-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Variables Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

require("config/color")

hl.config({
    -- https://wiki.hyprland.org/Configuring/Variables/#general
    general = {
        gaps_in = 3,
        gaps_out = 5,
        border_size = 3,
        ["col.active_border"] = primary,
        ["col.inactive_border"] = secondary,
        layout = "dwindle", -- master|dwindle

        -- https://wiki.hyprland.org/Configuring/Variables/#snap
        snap = {
            enabled = true,
        },
    },

    -- https://wiki.hyprland.org/Configuring/Variables/#group
    group = {
        ["col.border_active"] = primary,
        ["col.border_inactive"] = secondary,
        ["col.border_locked_active"] = primary_fixed,
        ["col.border_locked_inactive"] = secondary_fixed,

        -- https://wiki.hyprland.org/Configuring/Variables/#groupbar
        groupbar = {
            font_family = "Fira Sans",
            text_color = surface,
            ["col.active"] = primary,
            ["col.inactive"] = secondary,
            ["col.locked_active"] = primary_fixed,
            ["col.locked_inactive"] = secondary_fixed,
        },
    },

    -- https://wiki.hyprland.org/Configuring/Variables/#misc
    misc = {
        font_family = "Fira Sans",
        splash_font_family = "Fira Sans",
        disable_hyprland_logo = true,
        ["col.splash"] = inverse_on_surface,
        background_color = background,
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