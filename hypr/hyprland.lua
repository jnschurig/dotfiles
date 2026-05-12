mainMod = "SUPER"

package.path = package.path .. ";./?.lua;./?/init.lua"

require("config.defaults")
require("config.environment")
require("config.monitor")
require("config.input")
require("config.decorations")
require("config.variables")
require("config.animations")
require("config.windowrules")
require("config.keybinds")
require("config.autostart")
