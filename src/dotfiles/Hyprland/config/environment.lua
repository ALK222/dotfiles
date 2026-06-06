-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Environment Configuration                ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

hl.env("HYPRCURSOR_SIZE", 24)
hl.env("XCURSOR_SIZE", 24)
hl.env("QT_CURSOR_SIZE", 24)
hl.env("QT_QPA_PLATFORMTHEME_QT6", "qt6ct")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("xx-color-management-v4", "true")
hl.env("PROTON_ENABLE_WAYLAND", 1)
hl.env("WLR_NO_HARDWARE_CURSORS", 1)
hl.env("WLR_RENDERER_ALLOW_SOFTWARE", 1)
hl.env("XDG_MENU_PREFIX", "arch-")

-- NVIDIA Specific Configuration
hl.env("PROTON_ENABLE_NVAPI", 1)
hl.env("PROTON_FORCE_NVAPI", 1)
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("__GL_GSYNC_ALLOWED", 1)
hl.env("__GL_VRR_ALLOWED", 1)
hl.env("PROTON_ENABLE_NGX_UPDATER", 1)
hl.env("NGX_DLSS_SR_OVERRIDE", "on")
hl.env("NGX_DLSS_RR_OVERRIDE", "on")
hl.env("NGX_DLSS_FG_OVERRIDE", "on")
hl.env("PROTON_DLSS_UPGRADE", 1)
hl.env("DXVK_NVAPI_DRS_NGX_DLSS_SR_OVERRIDE", "on")
hl.env("DXVK_NVAPI_DRS_NGX_DLSS_RR_OVERRIDE", "on")
hl.env("DXVK_NVAPI_DRS_NGX_DLSS_FG_OVERRIDE", "on")

-- Commented-out Render Presets
-- hl.env("DXVK_NVAPI_DRS_NGX_DLSS_SR_OVERRIDE_RENDER_PRESET_SELECTION", "render_preset_latest")
-- hl.env("DXVK_NVAPI_DRS_NGX_DLSS_RR_OVERRIDE_RENDER_PRESET_SELECTION", "render_preset_latest")