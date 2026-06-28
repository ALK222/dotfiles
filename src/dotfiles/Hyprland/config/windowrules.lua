-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Windowrules Configuration (Lua Syntax)                      ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛


-- --- Float Necessary Windows ---
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Picture in picture)$" }, float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Save File)$" }, float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Open File)$" }, float = true })
hl.window_rule({ match = { class = "^(LibreWolf)$", title = "^(Picture-in-Picture)$" }, float = true })
hl.window_rule({ match = { class = "^(blueman-manager)$" }, float = true })
hl.window_rule({ match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" }, float = true })
hl.window_rule({ match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$" }, float = true })
hl.window_rule({ match = { class = "^(CachyOSHello)$" }, float = true })
hl.window_rule({ match = { class = "^(zenity)$" }, float = true })
hl.window_rule({ match = { class = "^()$", title = "^(Steam - Self Updater)$" }, float = true })


-- --- General Window Rules ---
-- Picture-in-Picture specific
hl.window_rule({
    name = "pip",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    size = { 960, 540 },
    center = true,
})

-- Floating Media/Tools
hl.window_rule({
    name = "floating-media-tools",
    match = { title = "^(imv|mpv|danmufloat|termfloat|nemo|ncmpcpp)$" },
    float = true,
    size = { 960, 540 },
    center = true,
})

-- Specific visual tweaks
hl.window_rule({ match = { title = "^(danmufloat)$" }, pin = true })
hl.window_rule({ match = { title = "^(danmufloat|termfloat)$" }, rounding = 5 })
hl.window_rule({ match = { class = "^(kitty|Alacritty)$" }, animation = "slide right" })
hl.window_rule({ match = { class = "^(org.mozilla.firefox)$" }, no_blur = true })

-- --- Logic-Based Decorations (Workspaces 1-10) ---
-- Floating windows
hl.window_rule({
    name = "decorations-float",
    match = { float = true, workspace = "w[fv1-10]" },
    border_size = 2,
    border_color = primary,
    rounding = 8,
    center = true,
})

-- Tiling windows
hl.window_rule({
    name = "tilling",
    match = { float = false, workspace = "f[1-10]" },
    border_size = 3,
    rounding = 4,
})
-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Workspace Rules                                             ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

hl.workspace_rule({workspace = "w[tv1-10]", gaps_out = 5, gaps_in = 3})
hl.workspace_rule({workspace = "f[1]", gaps_out = 5, gaps_in = 3})

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Layer Rules                                                 ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
hl.config({
    decoration = {
        blur = {
            enabled = true,
            size = 1,
            passes = 2,
            xray = false,
            -- Tweaks for more transparency / glass effect:
            vibrancy = 0.20,       -- High values give a more colorful "glass" feel
            vibrancy_darkness = 0.20,
            noise = 0.015,         -- Very subtle noise prevents pure color banding
        }
    }
})
-- Glassmorphism for Rofi
hl.layer_rule({ 
    match = { namespace = "rofi" }, 
    blur = true,
    ignore_alpha = 0.1,
    animation = "slide down" 
})

-- Glassmorphism for Wlogout
hl.layer_rule({ 
    match = { namespace = "logout_dialog" }, 
    blur = true,
    ignore_alpha = 0.1
})

hl.layer_rule({ 
    match = { namespace = "waybar" }, 
    blur = true,
    ignore_alpha = 0.1
})

hl.layer_rule({ 
    match = { namespace = "swayosd" }, 
    blur = true,
    ignore_alpha = 0.1
})
