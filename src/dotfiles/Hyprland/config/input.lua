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