hl.window_rule({
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^()$", title = "^(Picture in picture)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(blueman-manager)$" },
	float = true,
})

hl.window_rule({
	match = { class = "^(gsimplecal)$" },
	float = true,
	pin = true,
	move = { "cursor_x-(window_w*0.5)", 40 },
})

hl.window_rule({
	match = { class = "^(discord|armcord|webcord|legcord)$" },
	opacity = 0.96,
})

hl.window_rule({
	match = { class = "^(kitty|Alacritty|ghostty)$" },
	animation = "slide right",
})

hl.workspace_rule({ workspace = "w[tv1-10]", gaps_out = 5, gaps_in = 3 })
hl.workspace_rule({ workspace = "f[1]",       gaps_out = 5, gaps_in = 3 })

hl.layer_rule({ match = { namespace = "waybar" },     animation = "slide down" })
hl.layer_rule({ match = { namespace = "overlay" },    animation = "slide top" })
hl.layer_rule({ match = { namespace = "background" }, animation = "fade 50%" })
