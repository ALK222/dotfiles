-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                 CachyOS Hyprland Configuration              ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Source Files                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
require("config/animations")
require("config/autostart")
require("config/decorations")
require("config/environment")
require("config/input")
require("config/keybinds")
require("config/monitor")
require("config/variables")
require("config/windowrules")

-- Glob matching for legacy .conf files is executed via require
local function require_all(folder)
    for path in io.popen('ls ' .. os.getenv("HOME") .. '/.config/hypr/' .. folder .. '/*.lua'):lines() do
        require(path:match("hypr/(.+).lua$"))
    end
end
require_all("config/game-fixes")

-- Modifying these configs can be done by creating a user defined config in the home directory, e.g.
-- ~/.config/hypr/config/user-config.conf
-- require("~/.config/hypr/config/user-config.conf")