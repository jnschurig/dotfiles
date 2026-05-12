mainMod = "SUPER"

-- require("config.animations")
-- require("config.autostart")
-- require("config.decorations")
-- require("config.environment")
-- require("config.input")
-- require("config.keybinds")
-- require("config.monitor")
-- require("config.variables")
-- require("config.windowrules")

-- local config_dir = os.getenv("HOME") .. "/.config/hypr/?.lua;"
-- package.path = config_dir .. package.path
package.path = package.path .. ";./?.lua;./?/init.lua"

require("config.animations")
require("config.autostart")
require("config.decorations")
require("config.defaults")
require("config.environment")
require("config.input")
require("config.keybinds")
require("config.monitor")
require("config.variables")
require("config.windowrules")
