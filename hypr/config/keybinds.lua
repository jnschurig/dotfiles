require("config.defaults")

local binds = {
	{
		mod = mainMod,
		key = "E",
		action = hl.action.exec,
		arg = filemanager,
		description = "Open file manager",
	},

	{
		mod = mainMod,
		key = "SPACE",
		action = hl.action.exec,
		arg = applauncher,
		description = "Open app launcher",
	},

	{
		mod = mainMod,
		key = "Q",
		action = hl.action.killactive,
		description = "Close active window",
	},

	{
		mod = mainMod,
		key = "F",
		action = hl.action.fullscreen,
		description = "Toggle fullscreen",
	},

	{
		mod = mainMod .. " SHIFT",
		key = "F",
		action = hl.action.togglefloating,
		description = "Toggle floating",
	},

	{
		mod = mainMod,
		key = "RETURN",
		action = hl.action.exec,
		arg = terminal,
		description = "Open terminal",
	},

	{
		mod = "",
		key = "XF86AudioRaiseVolume",
		action = hl.action.exec,
		arg = "pamixer -i 5",
	},

	{
		mod = "",
		key = "XF86AudioLowerVolume",
		action = hl.action.exec,
		arg = "pamixer -d 5",
	},
}

for _, bind in ipairs(binds) do
	hl.bind(bind)
end

for i = 1, 10 do
	local key = tostring(i % 10)

	hl.bind({
		mod = mainMod,
		key = key,
		action = hl.action.workspace,
		arg = tostring(i),
	})

	hl.bind({
		mod = mainMod .. " SHIFT",
		key = key,
		action = hl.action.movetoworkspace,
		arg = tostring(i),
	})
end
