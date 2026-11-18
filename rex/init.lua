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
rex.bind("ctrl+shift+t", "pane_to_new_tab")
rex.bind("ctrl+shift+alt+t", "pane.move_to_tab")
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

-- Move the focused pane into a brand-new tab. The new tab starts with a
-- throwaway placeholder (`sleep 1`) that closes itself once the pane is moved in.
rex.action({
	name = "pane_to_new_tab",
	title = "Move Pane to New Tab",
	run = function()
		local function check(r, e)
			if e ~= nil then
				error(e, 0)
			end
			return r
		end
		local view = check(rex.session.view({}))
		local active
		for _, w in ipairs(view.windows or {}) do
			if w.window_id == view.active_window_id then
				active = w
			end
		end
		if active == nil or active.focused_block_id == nil then
			return
		end
		local nw = check(rex.session.new_window({
			layout = {
				block = {
					flavor = "com.superlogical.terminal.shell",
					options = { command = { "sleep", "1" } },
				},
			},
		}))
		check(rex.session.move_block({
			block_id = active.focused_block_id,
			anchor_block_id = nw.block_ids[1],
		}))
		check(rex.session.focus_block({ block_id = active.focused_block_id }))
	end,
})
