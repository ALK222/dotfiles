-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                      Input Configuration                    ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Input wiki https://wiki.hyprland.org/Configuring/Variables/#input

hl.config({
    input = {
        kb_layout = "es",
        follow_mouse = 2, -- 0|1|2|3
        float_switch_override_focus = 2,

        touchpad = {
            disable_while_typing = false,
            natural_scroll = true
        },
    },

    gestures = {
        workspace_swipe_create_new = false,
        workspace_swipe_forever = true,
    },

    cursor = {
        no_hardware_cursors = true,
    },

    -- Root level experimental / specialized configurations
    -- no_break_fs_vrr = 1,
})

if hl.plugin.dynamic_cursors then

hl.config { plugin = { dynamic_cursors = {

    -- enables the plugin
    enabled = true,

    -- sets the cursor behaviour, supports these values:
    -- tilt    - tilt the cursor based on x-velocity
    -- rotate  - rotate the cursor based on movement direction
    -- stretch - stretch the cursor shape based on direction and velocity
    -- none    - do not change the cursor's behaviour
    mode = "none",

    -- minimum angle difference in degrees after which the shape is changed
    -- smaller values are smoother, but more expensive for hw cursors
    threshold = 2,

    -- configure shake to find
    -- magnifies the cursor if its is being shaken
    shake = {

        -- enables shake to find
        enabled = true,

        -- controls how soon a shake is detected
        -- lower values mean sooner
        threshold = 6.0,

        -- magnification level immediately after shake start
        base = 4.0,
        -- magnification increase per second when continuing to shake
        speed = 4.0,
        -- how much the speed is influenced by the current shake intensity
        influence = 0.0,

        -- maximal magnification the cursor can reach
        -- values below 1 disable the limit (e.g. 0)
        limit = 1.0,

        -- time in milliseconds the cursor will stay magnified after a shake has ended
        timeout = 2000,

        -- show cursor behaviour `tilt`, `rotate`, etc. while shaking
        effects = false,

        -- enable ipc events for shake
        -- see the `ipc` section below
        ipc = false,
    },

    -- use hyprcursor to get a higher resolution texture when the cursor is magnified
    -- see the `hyprcursor` section below
    hyprcursor = {

        -- use nearest-neighbour (pixelated) scaling when magnifying beyond texture size
        -- this will also have effect without hyprcursor support being enabled
        -- 0 - never use pixelated scaling
        -- 1 - use pixelated when no highres image
        -- 2 - always use pixelated scaling
        nearest = 1,

        -- enable dedicated hyprcursor support
        enabled = true,

        -- resolution in pixels to load the magnified shapes at
        -- be warned that loading a very high-resolution image will take a long time and might impact memory consumption
        -- -1 means we use [normal cursor size] * [shake:base option]
        resolution = -1,

        -- shape to use when clientside cursors are being magnified
        -- see the shape-name property of shape rules for possible names
        -- specifying clientside will use the actual shape, but will be pixelated
        fallback = "clientside",
    },
}}}

end
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Per-Device Overrides                     ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

hl.device( {
    name = "sonix-ak820",
    kb_layout = "us, es",
    kb_options = "grp:alt_space_toggle",
})

hl.device({
    name = "2.4g-dongle",
    kb_layout = "us, es",
    kb_options = "grp:alt_space_toggle",
})

hl.device({
    name = "corsair-corsair-gaming-k95-rgb-platinum-keyboard",
    kb_layout = "es",
})

-- Prevent mouse warping during Unity Inspector scrubbing
hl.config({
    cursor = {
        no_warps = true,
    },
})
