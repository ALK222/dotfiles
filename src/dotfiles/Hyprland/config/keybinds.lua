-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Keybinds                            ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

require("config/defaults")

function ToggleFloat()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
end

-- Global Mod Reference
local mod = "SUPER"


-- ======= Core System Actions =======
hl.bind(mod .. " + RETURN",   hl.dsp.exec_cmd(_G.terminal), { description = "Opens your preferred terminal emulator (" .. _G.terminal .. ")" })
hl.bind(mod .. " + SHIFT + RETURN", hl.dsp.exec_cmd(_G.filemanager), { description = "Opens your preferred filemanager (" .. _G.filemanager .. ")" })
hl.bind(mod .. " + Q",        hl.dsp.window.close(), { description = "Closes (not kill) current window" })
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd("loginctl terminate-user ''"), { description = "Exits Hyprland by terminating the user sessions" })
hl.bind(mod .. " + SHIFT + V", ToggleFloat, { description = "Switches current window between floating and tiling mode" })
hl.bind(mod .. " + V",        hl.dsp.exec_cmd("dms ipc call clipboard toggle"), { description = "Clipboard toggle" })
hl.bind(mod .. " + SPACE",    hl.dsp.exec_cmd("dms ipc call spotlight toggle"), { description = "Runs your application launcher" })
hl.bind(mod .. " + SHIFT + F", hl.dsp.window.fullscreen(), { description = "Toggles current window fullscreen mode" })
hl.bind(mod .. " + Y",        hl.dsp.window.pin(), { description = "Pin current window (shows on all workspaces)" })
hl.bind(mod .. " + M",        hl.dsp.exec_cmd("dms ipc call processlist toggle"), { description = "Toggles process list" })
hl.bind(mod .. " + N",        hl.dsp.exec_cmd("dms ipc call notifications toggle"), { description = "Toggles notifications" })
hl.bind(mod .. " + comma",    hl.dsp.exec_cmd("dms ipc call settings toggle"), { description = "Toggles settings" })
hl.bind(mod .. " + P",        hl.dsp.exec_cmd("dms ipc call notepad toggle"), { description = "Toggles notepad" })
hl.bind(mod .. " + L",        hl.dsp.exec_cmd("dms ipc call lock lock"), { description = "Activates lock" })
hl.bind(mod .. " + X",        hl.dsp.exec_cmd("dms ipc call powermenu toggle"), { description = "Toggles PowerMenu" })
hl.bind(mod .. " + W",        hl.dsp.exec_cmd("dms ipc call dankdash wallpaper"), { description = "Wallpaper" })
hl.bind(mod .. " + SHIFT + C", hl.dsp.exec_cmd("dms ipc call control-center toggle"), { description = "Control center" })
hl.bind(mod .. " + TAB",      hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"), { description = "Toggle view" })

-- ======= Grouping Windows =======
-- hl.bind(mod .. " + K",         hl.dsp.window.toggle_group(), { description = "Toggles current window group mode (ungroup all related)" })
-- hl.bind(mod .. " + SHIFT + Tab", hl.dsp.window.change_group_active({ direction = "f" }), { description = "Switches to the next window in the group" })

-- ======= Toggle Gaps =======
hl.bind(mod .. " + SHIFT + G", hl.dsp.exec_cmd([[hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"]]), { description = "Set CachyOS default gaps" })
hl.bind(mod .. " + ALT + G",   hl.dsp.exec_cmd([[hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"]]), { description = "Remove gaps between window" })

-- ======= Volume Control =======
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("dms ipc call audio increment 5"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("dms ipc call audio decrement 5"), { repeating = true, locked = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("dms ipc call audio mute"), { locked = true })

-- ======= Playback Control =======
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- ======= Screen Brightness Management =======
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("dms ipc call brightness increment 5"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("dms ipc call brightness decrement 5"), { repeating = true, locked = true })
hl.bind(mod .. " + L",           hl.dsp.exec_cmd("dms ipc call lock lock"), { description = "Lock the screen" })

-- ======= Window Actions & Focus =======
hl.bind(mod .. " + SHIFT + left",    hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + right",   hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + up",      hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + down",    hl.dsp.window.move({ direction = "d" }))

hl.bind(mod .. " + left",            hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + right",           hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + up",              hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + down",            hl.dsp.focus({ direction = "d" }))

-- ======= Rapid Inline Sizing Modifiers =======
hl.bind(mod .. " + CTRL + SHIFT + right", hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + SHIFT + left",  hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + SHIFT + up",    hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + SHIFT + down",  hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + SHIFT + l",     hl.dsp.window.resize({ x = 15, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + SHIFT + h",     hl.dsp.window.resize({ x = -15, y = 0, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + SHIFT + k",     hl.dsp.window.resize({ x = 0, y = -15, relative = true }), { repeating = true })
hl.bind(mod .. " + CTRL + SHIFT + j",     hl.dsp.window.resize({ x = 0, y = 15, relative = true }), { repeating = true })

-- Mouse Interactivity Rules
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })

-- ======= Shifting Windows Across Workspaces =======
for i = 1, 9 do
    hl.bind(mod .. " + CTRL + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i), follow = false }))
end
hl.bind(mod .. " + CTRL + 0", hl.dsp.window.move({ workspace = "10" }))
hl.bind(mod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10", follow = false }))

hl.bind(mod .. " + CTRL + left",  hl.dsp.window.move({ workspace = "r-1" }))
hl.bind(mod .. " + CTRL + right", hl.dsp.window.move({ workspace = "r+1" }))

-- ======= Workspace Navigation =======
for i = 1, 9 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = tostring(i) }))
end
hl.bind(mod .. " + 0", hl.dsp.focus({ workspace = "10" }))

hl.bind(mod .. " + PERIOD",     hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mod .. " + COMMA",      hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "r+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mod .. " + slash",      hl.dsp.focus({ workspace = "previous" }))

-- ======= Special Workspaces (Scratchpads) =======
hl.bind(mod .. " + minus", hl.dsp.window.move({ workspace = "special" }))
hl.bind(mod .. " + equal", hl.dsp.focus({ workspace = "special" }))
hl.bind(mod .. " + F1",    hl.dsp.focus({ workspace = "special:scratchpad" }))
hl.bind(mod .. " + ALT + SHIFT + F1", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- ======= Screenshot Layout Utilities =======
hl.bind(mod .. " + SHIFT + S",       hl.dsp.exec_cmd("dms screenshot"), { description = "Creates a screenshot of an area" })
hl.bind("Print",                     hl.dsp.exec_cmd("dms screenshot"))
hl.bind("CTRL + Print",              hl.dsp.exec_cmd("dms screenshot full"))
hl.bind("ALT + Print",               hl.dsp.exec_cmd("dms screenshot window"))

-- ======= Default App Access Shortcuts =======
hl.bind(mod .. " + F", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + G", hl.dsp.exec_cmd("gitkraken"))
hl.bind(mod .. " + C", hl.dsp.exec_cmd("code"))

-- ======= Global Workspace Management Options =======
hl.config({
    binds = {
        allow_workspace_cycles = 1,
        workspace_back_and_forth = 1,
        workspace_center_on = 1,
        movefocus_cycles_fullscreen = true,
        window_direction_monitor_fallback = true,
    },
})