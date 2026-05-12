hl.config({
	animations = {
		enabled = true,
	},
})

hl.curve("overshot", {
	type = "bezier",
	points = { { 0.13, 0.99 }, { 0.29, 1.1 } },
})

local anims = {
	{ leaf = "windowsIn",           speed = 4, bezier = "overshot", style = "slide" },
	{ leaf = "windowsOut",          speed = 5, bezier = "default",  style = "popin 80%" },
	{ leaf = "border",              speed = 5, bezier = "default" },
	{ leaf = "workspacesIn",        speed = 6, bezier = "overshot", style = "slide" },
	{ leaf = "workspacesOut",       speed = 6, bezier = "overshot", style = "slidefade 80%" },
	{ leaf = "specialWorkspaceIn",  speed = 4, bezier = "overshot", style = "slidevert" },
	{ leaf = "specialWorkspaceOut", speed = 4, bezier = "overshot", style = "slidefadevert 80%" },
}

for _, a in ipairs(anims) do
	a.enabled = true
	hl.animation(a)
end
