local mod      = mainMod
local modshift = mainMod .. " + SHIFT"
local modctrl  = mainMod .. " + CTRL"
local modalt   = mainMod .. " + ALT"

local function bind(keys, dispatcher, opts)
	hl.bind(keys, dispatcher, opts or {})
end

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                       General                               ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

bind(mod .. " + E",        hl.dsp.exec_cmd(filemanager),     { description = "Open file manager" })
bind("SHIFT + Print",      hl.dsp.exec_cmd(capturing),       { description = "Screen capture selection" })
bind(mod .. " + Q",        hl.dsp.window.close(),            { description = "Close active window" })
bind(mod .. " + F",        hl.dsp.window.fullscreen(),       { description = "Toggle fullscreen" })
bind(modshift .. " + F",   hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
bind(mod .. " + SPACE",    hl.dsp.exec_cmd(applauncher),     { description = "App launcher" })
bind(mod .. " + Y",        hl.dsp.window.pin(),              { description = "Pin window across workspaces" })
bind(modshift .. " + J",   hl.dsp.layout("togglesplit"),     { description = "Toggle split (dwindle)" })
bind(modshift .. " + P",   hl.dsp.exec_cmd("~/.config/rofi/poweroff.sh"), { description = "Rofi power menu" })

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                  Session / Waybar / Reload                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

bind(modctrl .. " + B", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"), { description = "Reload waybar" })
bind(modctrl .. " + N", hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"),   { description = "Kill waybar" })
bind(modctrl .. " + R", hl.dsp.exec_cmd("hyprctl reload | notify-send 'Hyprctl Reload Complete'"), { description = "Reload Hyprland config" })

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                       Game Mode                             ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

bind(modshift .. " + G", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/gamemode.sh"), { description = "Game mode toggle" })

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                      Grouping Windows                       ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

bind(mod .. " + G", hl.dsp.group.toggle(), { description = "Toggle window group" })

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                       Volume Control                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

bind("XF86AudioRaiseVolume",         hl.dsp.exec_cmd("pamixer -i 5"), { repeating = true })
bind("XF86AudioLowerVolume",         hl.dsp.exec_cmd("pamixer -d 5"), { repeating = true })
bind("XF86AudioMute",                hl.dsp.exec_cmd("pamixer -t"),   { locked = true })

bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer --default-source -i 5"), { repeating = true })
bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer --default-source -d 5"), { repeating = true })
bind("SHIFT + XF86AudioMute",        hl.dsp.exec_cmd("pamixer --default-source -t"),   { locked = true })

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Playback Control                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggle play/pause" })
bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { description = "Next track" })
bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { description = "Previous track" })

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                        Brightness                           ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

bind("XF86MonBrightnessUp",          hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true })
bind("XF86MonBrightnessDown",        hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })
bind("SHIFT + XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set +33%"), { repeating = true })
bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -d *::kbd_backlight set 33%-"), { repeating = true })

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                      Window Movement                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local directions = {
	left  = "l", right = "r", up = "u", down = "d",
	h = "l",     l     = "r", k  = "u", j    = "d",
}

for key, dir in pairs(directions) do
	-- Move active window in a direction
	bind(modshift .. " + " .. key, hl.dsp.window.swap({ direction = dir }), { description = "Move window " .. dir })
	-- Move focus
	bind(mod .. " + " .. key,      hl.dsp.focus({ direction = dir }),       { description = "Focus " .. dir })
	-- Resize window
	bind(modalt .. " + " .. key,   hl.dsp.window.resize({ direction = dir, delta = 15 }), { repeating = true, description = "Resize " .. dir })
end

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Workspace Movement                      ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

for i = 1, 10 do
	local key = tostring(i % 10)
	-- Switch to workspace
	bind(mod .. " + " .. key,      hl.dsp.focus({ workspace = i }),                              { description = "Workspace " .. i })
	-- Move window to workspace and follow
	bind(modshift .. " + " .. key, hl.dsp.window.move({ workspace = i }),                         { description = "Move window to ws " .. i })
	-- Move window silently (alt+shift)
	bind("ALT SHIFT + " .. key,    hl.dsp.window.move({ workspace = i, silent = true }),         { description = "Silently move window to ws " .. i })
end

-- Workspace scrolling
bind(mod .. " + PERIOD",     hl.dsp.focus({ workspace = "e+1" }))
bind(mod .. " + COMMA",      hl.dsp.focus({ workspace = "e-1" }))
bind(mod .. " + Tab",        hl.dsp.focus({ workspace = "e+1" }))
bind(modshift .. " + Tab",   hl.dsp.focus({ workspace = "e-1" }))
bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
bind(mod .. " + slash",      hl.dsp.focus({ workspace = "previous" }))

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Special Workspaces                       ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

bind(mod .. " + RETURN",      hl.dsp.workspace.toggle_special())
bind(mod .. " + ESCAPE",      hl.dsp.workspace.toggle_special())
bind(modshift .. " + ESCAPE", hl.dsp.window.move({ workspace = "special" }))
bind("ALT SHIFT + ESCAPE",    hl.dsp.window.move({ workspace = "special", silent = true }))

bind(mod .. " + grave",       hl.dsp.workspace.toggle_special("scratchpad"))
bind(modshift .. " + grave",  hl.dsp.window.move({ workspace = "special:scratchpad" }))
bind("ALT SHIFT + grave",     hl.dsp.window.move({ workspace = "special:scratchpad", silent = true }))

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Mouse Bindings                          ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- NOTE: drag-to-move/resize bindings use the `drag` opt + window.drag/resize dispatchers
bind(mod .. " + mouse:272", hl.dsp.window.drag(),   { drag = true, description = "Drag move window" })
bind(mod .. " + mouse:273", hl.dsp.window.resize(), { drag = true, description = "Drag resize window" })
