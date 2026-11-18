rex.bind("alt+j", "client.prompt.next")
rex.bind("alt+k", "client.prompt.previous")
rex.bind("alt+down", "client.prompt.next")
rex.bind("alt+up", "client.prompt.previous")
rex.bind("alt+tab", "pane.focus_next")
rex.bind("alt+shift+tab", "pane.focus_previous")
rex.bind("ctrl+shift+j", "pane.split", { direction = "down" })
rex.bind("ctrl+shift+l", "pane.split", { direction = "right" })
rex.bind("ctrl+shift+down", "pane.split", { direction = "down" })
rex.bind("ctrl+shift+right", "pane.split", { direction = "right" })
rex.bind("ctrl+shift+r", "pane.balance")
rex.bind("ctrl+shift+t", "pane.move_to_tab")
rex.bind("ctrl+shift+n", "pane.move_to_new_tab")
rex.unbind("super+enter")
rex.unbind("super+shift+d")

local toggle_pane = require("toggle_pane")

toggle_pane({
	name = "scratch_toggle",
	title = "Toggle Scratch Pane",
	label = "scratch",
	key = "super+escape",
})

toggle_pane({
	name = "sqlit_toggle",
	title = "Toggle sqlit",
	label = "sqlit",
	-- command = { "sqlit" },
	key = "control+shift+d",
})
