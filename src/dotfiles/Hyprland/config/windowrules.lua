-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃ Windowrules Configuration (Lua Syntax)                      ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- --- Center Fullscreen Logic ---
hl.window_rule({
    name = "center-fullscreen",
    match = { fullscreen = true },
    center = true,
})

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

-- --- Opacity Rules ---
hl.window_rule({ match = { class = "^(thunar|nemo)$" }, opacity = 0.92 })
hl.window_rule({ match = { class = "^(discord|armcord|webcord)$" }, opacity = 0.96 })
hl.window_rule({ match = { title = "^(QQ|Telegram)$" }, opacity = 0.95 })
hl.window_rule({ match = { title = "^(NetEase Cloud Music Gtk4)$" }, opacity = 0.95 })

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

-- Slide top animation for the logout dialog
hl.layer_rule({ 
    match = { namespace = "logout_dialog" }, 
    animation = "slide top" 
})

-- Slide down animation for waybar
hl.layer_rule({ 
    match = { namespace = "waybar" }, 
    animation = "slide down" 
})

-- Fade animation for your wallpaper
hl.layer_rule({ 
    match = { namespace = "wallpaper" }, 
    animation = "fade 50%" 
})