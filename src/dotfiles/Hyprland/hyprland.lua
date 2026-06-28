-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                 CachyOS Hyprland Configuration              ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Source Files                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
require("config/animations")
require("config/autostart")
require("config/environment")
require("config/input")
require("config/keybinds")
require("config/monitor")
require("config/variables")
require("config/windowrules")

local function require_all(folder)
    for path in io.popen('ls ' .. os.getenv("HOME") .. '/.config/hypr/' .. folder .. '/*.lua'):lines() do
        require(path:match("hypr/(.+).lua$"))
    end
end
require_all("config/game-fixes")
