local rules = {
	"float,class:^(org.pulseaudio.pavucontrol)$",
	"float,class:^()$ title:^(Picture in picture)$",
	"float,class:^(blueman-manager)$",
	"opacity 0.96,class:^(discord|armcord|webcord|legcord)$",
	"animation slide right,class:^(kitty|Alacritty|ghostty)$",
}

for _, rule in ipairs(rules) do
	windowrule(rule)
end

workspace_rule("w[tv1-10], gapsout:5, gapsin:3")
workspace_rule("f[1], gapsout:5, gapsin:3")

layerrule("animation slide down waybar")
layerrule("animation slide top overlay")
layerrule("animation fade 50% background")
