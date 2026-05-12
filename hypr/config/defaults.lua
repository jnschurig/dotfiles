function hypr_exec_once(cmd)
	-- wrapper around hyprland exec-once
end

function env(name, value)
	if CONFIG.env == nil then
		CONFIG.env = {}
	end

	CONFIG.env[#CONFIG.env + 1] = {
		name = name,
		value = value,
	}
end

CONFIG.binds = CONFIG.binds or {}
function bind(opts)
	table.insert(CONFIG.binds, opts)
end

action = {
	exec = "exec",
	killactive = "killactive",
	fullscreen = "fullscreen",
	togglefloating = "togglefloating",
	workspace = "workspace",
	movetoworkspace = "movetoworkspace",
}

CONFIG.windowrules = CONFIG.windowrules or {}
CONFIG.workspace_rules = CONFIG.workspace_rules or {}
CONFIG.layerrules = CONFIG.layerrules or {}

function windowrule(rule)
	table.insert(CONFIG.windowrules, rule)
end

function workspace_rule(rule)
	table.insert(CONFIG.workspace_rules, rule)
end

function layerrule(rule)
	table.insert(CONFIG.layerrules, rule)
end

filemanager = "dolphin"
applauncher = "rofi -show run -modi window,run,combi -combi-modi window,run"
background_img = os.getenv("HOME") .. "/Pictures/wallpaper/lock_screen/crossing_in_japan.jpg"
terminal = "ghostty"
idlehandler = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'"
capturing = [[grim -g "$(slurp)" - | swappy -f -]]
set_colors = os.getenv("HOME") .. "/config_wrapper.sh"
