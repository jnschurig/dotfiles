require("config.defaults")

local binds = {
	{
		mod = mainMod,
		key = "E",
		action = action.exec,
		arg = filemanager,
		description = "Open file manager",
	},

	{
		mod = mainMod,
		key = "SPACE",
		action = action.exec,
		arg = applauncher,
		description = "Open app launcher",
	},

	{
		mod = mainMod,
		key = "Q",
		action = action.killactive,
		description = "Close active window",
	},

	{
		mod = mainMod,
		key = "F",
		action = action.fullscreen,
		description = "Toggle fullscreen",
	},

	{
		mod = mainMod .. " SHIFT",
		key = "F",
		action = action.togglefloating,
		description = "Toggle floating",
	},

	{
		mod = mainMod,
		key = "RETURN",
		action = action.exec,
		arg = terminal,
		description = "Open terminal",
	},

	{
		mod = "",
		key = "XF86AudioRaiseVolume",
		action = action.exec,
		arg = "pamixer -i 5",
	},

	{
		mod = "",
		key = "XF86AudioLowerVolume",
		action = action.exec,
		arg = "pamixer -d 5",
	},
}

for _, b in ipairs(binds) do
	bind(b)
end

for i = 1, 10 do
	local key = tostring(i % 10)

	bind({
		mod = mainMod,
		key = key,
		action = action.workspace,
		arg = tostring(i),
	})

	-- bind({
	-- 	mod = mainMod .. " SHIFT",
	-- 	key = key,
	-- 	action = action.movetoworkspace,
	-- 	arg = tostring(i),
	-- })
end
