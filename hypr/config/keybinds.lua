local mod = mainMod
local modshift = mainMod .. " + SHIFT"

hl.bind(mod .. " + E",      hl.dsp.exec_cmd(filemanager),  { description = "Open file manager" })
hl.bind(mod .. " + SPACE",  hl.dsp.exec_cmd(applauncher),  { description = "Open app launcher" })
hl.bind(mod .. " + Q",      hl.dsp.window.close(),         { description = "Close active window" })
hl.bind(mod .. " + F",      hl.dsp.window.fullscreen(),    { description = "Toggle fullscreen" })
hl.bind(modshift .. " + F", hl.dsp.window.float({ action = "toggle" }), { description = "Toggle floating" })
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd(terminal),     { description = "Open terminal" })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"))

for i = 1, 10 do
	local key = tostring(i % 10)
	hl.bind(mod .. " + " .. key,      hl.dsp.focus({ workspace = i }))
	hl.bind(modshift .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end
